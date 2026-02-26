<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Core\Base\Facades\EmailHandler;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Customer;
use Illuminate\Auth\Events\Registered;

class SendMailsAfterCustomerRegistered
{
    public function handle(Registered $event): void
    {
        $customer = $event->user;

        if (! $customer instanceof Customer) {
            return;
        }

        if (EcommerceHelper::isEnableEmailVerification()) {
            $customer->sendEmailVerificationNotification();
        } elseif (! is_plugin_active('marketplace') || ! $customer->is_vendor) {
            EmailHandler::setModule(ECOMMERCE_MODULE_SCREEN_NAME)
                ->setVariableValues([
                    'customer_name' => $customer->name,
                ])
                ->sendUsingTemplate('welcome', $customer->email);
        }
    }
}
