<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Plugins\Ecommerce\Events\OrderCompletedEvent;
use App\Plugins\Ecommerce\Facades\OrderHelper;
use App\Plugins\Ecommerce\Models\Order;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendDigitalProductEmailAfterOrderCompleted implements ShouldQueue
{
    public function handle(OrderCompletedEvent $event): void
    {
        $order = $event->order;

        if (! ($order instanceof Order)) {
            return;
        }

        OrderHelper::sendEmailForDigitalProducts($order);
    }
}
