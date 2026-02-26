<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Plugins\Ecommerce\Events\OrderPlacedEvent;
use App\Plugins\Ecommerce\Facades\Discount;

class HandleDiscountUsageOnOrderCompletion
{
    public function handle(OrderPlacedEvent $event): void
    {
        $order = $event->order;

        if ($order->coupon_code && $order->is_finished && $order->user_id) {
            Discount::getFacadeRoot()->afterOrderPlaced($order->coupon_code, $order->user_id);
        }
    }
}
