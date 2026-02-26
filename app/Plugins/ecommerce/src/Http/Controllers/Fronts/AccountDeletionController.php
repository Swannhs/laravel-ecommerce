<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Fronts;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Enums\DeletionRequestStatusEnum;
use App\Plugins\Ecommerce\Http\Requests\Fronts\AccountDeletionRequest;
use App\Plugins\Ecommerce\Jobs\CustomerDeleteAccountJob;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Ecommerce\Models\CustomerDeletionRequest;
use App\Plugins\Ecommerce\Notifications\ConfirmDeletionRequestNotification;
use App\Packages\Theme\Facades\Theme;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class AccountDeletionController extends BaseController
{
    public function store(AccountDeletionRequest $request)
    {
        /**
         * @var Customer $user
         */
        $user = $request->user('customer');

        /**
         * @var CustomerDeletionRequest $deletionRequest
         */
        $deletionRequest = CustomerDeletionRequest::query()->firstOrCreate([
            'customer_id' => $user->getKey(),
        ], [
            'customer_name' => $user->name,
            'customer_email' => $user->email,
            'customer_phone' => $user->phone,
            'token' => Str::random(60),
            'status' => DeletionRequestStatusEnum::WAITING_FOR_CONFIRMATION,
            'reason' => $request->input('reason'),
        ]);

        $user->notify(new ConfirmDeletionRequestNotification($deletionRequest));

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::account-deletion.request_submitted'));
    }

    public function confirm(string $token, Request $request)
    {
        /**
         * @var CustomerDeletionRequest $deletionRequest
         */
        $deletionRequest = CustomerDeletionRequest::query()
            ->where('token', $token)
            ->where('status', DeletionRequestStatusEnum::WAITING_FOR_CONFIRMATION)
            ->firstOrFail();

        abort_if($deletionRequest->customer()->isNot($request->user('customer')), 403);

        $deletionRequest->update([
            'status' => DeletionRequestStatusEnum::CONFIRMED,
            'confirmed_at' => Carbon::now(),
        ]);

        Auth::guard('customer')->logout();

        CustomerDeleteAccountJob::dispatch($deletionRequest);

        return Theme::scope(
            'ecommerce.customers.delete-account-confirmed',
            default: 'plugins/ecommerce::themes.customers.delete-account-confirmed'
        )->render();
    }
}
