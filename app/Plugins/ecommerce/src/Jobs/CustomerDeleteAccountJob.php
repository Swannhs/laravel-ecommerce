<?php

namespace App\Plugins\Ecommerce\Jobs;

use App\Core\Base\Facades\EmailHandler;
use App\Plugins\Ecommerce\Events\AccountDeletedEvent;
use App\Plugins\Ecommerce\Events\AccountDeletingEvent;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Ecommerce\Models\CustomerDeletionRequest;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class CustomerDeleteAccountJob implements ShouldQueue
{
    use Dispatchable;
    use InteractsWithQueue;
    use Queueable;
    use SerializesModels;

    public function __construct(public CustomerDeletionRequest $deletionRequest)
    {
    }

    public function handle(): void
    {
        /**
         * @var Customer $customer
         */
        $customer = Customer::query()->find($this->deletionRequest->customer_id);

        if (! $customer->exists) {
            return;
        }

        AccountDeletingEvent::dispatch($this->deletionRequest);

        $name = $customer->name;
        $email = $customer->email;

        $customer->delete();

        EmailHandler::setModule(ECOMMERCE_MODULE_SCREEN_NAME)
            ->setVariableValue('customer_name', $name)
            ->sendUsingTemplate('customer-deletion-request-completed', $email);

        AccountDeletedEvent::dispatch($email, $name, $customer);
    }
}
