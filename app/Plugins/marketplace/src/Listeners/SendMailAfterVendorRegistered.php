<?php

namespace App\Plugins\Marketplace\Listeners;

use App\Core\Base\Facades\EmailHandler;
use App\Plugins\Ecommerce\Models\Customer;
use Illuminate\Auth\Events\Registered;

class SendMailAfterVendorRegistered
{
    public function handle(Registered $event)
    {
        $customer = $event->user;

        if (! $customer instanceof Customer || ! $customer->is_vendor || ! $customer->store) {
            return;
        }

        $store = $customer->store;

        EmailHandler::setModule(MARKETPLACE_MODULE_SCREEN_NAME)
            ->setVariableValues([
                'vendor_name' => $customer->name,
                'shop_name' => $store->name,
            ])
            ->sendUsingTemplate('welcome-vendor', $customer->email);
    }
}
