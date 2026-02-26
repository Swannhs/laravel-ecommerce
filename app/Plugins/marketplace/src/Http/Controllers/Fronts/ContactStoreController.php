<?php

namespace App\Plugins\Marketplace\Http\Controllers\Fronts;

use App\Core\Base\Facades\EmailHandler;
use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Http\Requests\Fronts\ContactStoreRequest;
use App\Plugins\Marketplace\Models\Message;
use App\Plugins\Marketplace\Models\Store;

class ContactStoreController extends BaseController
{
    public function store(string $id, ContactStoreRequest $request): BaseHttpResponse
    {
        abort_unless(MarketplaceHelper::isEnabledMessagingSystem(), 404);

        $store = Store::query()
            ->wherePublished()
            ->findOrFail($id);

        $emailVariables = [
            'store_name' => $store->name,
            'store_phone' => $store->phone,
            'store_address' => $store->full_address,
            'store_url' => $store->url,
            'customer_message' => $request->input('content'),
        ];

        if (auth('customer')->check()) {
            $customer = auth('customer')->user();

            if ($customer->store?->id == $id) {
                return $this
                    ->httpResponse()
                    ->setError()
                    ->setMessage(trans('plugins/marketplace::message.cannot_send_to_own_store'));
            }

            $emailVariables = [
                ...$emailVariables,
                'customer_name' => $customer->name,
                'customer_email' => $customer->email,
            ];
        } else {
            $emailVariables = [
                ...$emailVariables,
                'customer_name' => $request->input('name'),
                'customer_email' => $request->input('email'),
            ];
        }

        Message::query()->create([
            'store_id' => $store->getKey(),
            'customer_id' => auth('customer')->id(),
            'name' => $emailVariables['customer_name'],
            'email' => $emailVariables['customer_email'],
            'content' => $request->input('content'),
        ]);

        EmailHandler::setModule(MARKETPLACE_MODULE_SCREEN_NAME)
            ->setVariableValues($emailVariables)
            ->sendUsingTemplate('contact-store', $store->email);

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/marketplace::message.send_message_successfully'));
    }
}
