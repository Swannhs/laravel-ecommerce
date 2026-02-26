<?php

namespace App\Plugins\Marketplace\Listeners;

use App\Core\Base\Facades\EmailHandler;
use App\Plugins\Ecommerce\Events\OrderCancelledEvent;
use App\Plugins\Ecommerce\Facades\OrderHelper;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;

class OrderCancelledEmailNotification
{
    public function handle(OrderCancelledEvent $event): void
    {
        $order = $event->order;

        if (! $order->store || ! $order->store->email) {
            return;
        }

        $mailer = EmailHandler::setModule(MARKETPLACE_MODULE_SCREEN_NAME);

        if ($mailer->templateEnabled('order_cancellation_to_vendor')) {
            OrderHelper::setEmailVariables($order);
            MarketplaceHelper::setEmailVendorVariables($order);

            $mailer->sendUsingTemplate('order_cancellation_to_vendor', $order->store->email);
        }
    }
}
