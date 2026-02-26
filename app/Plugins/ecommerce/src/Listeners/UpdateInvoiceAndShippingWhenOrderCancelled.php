<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Plugins\Ecommerce\Enums\InvoiceStatusEnum;
use App\Plugins\Ecommerce\Enums\ShippingStatusEnum;
use App\Plugins\Ecommerce\Events\OrderCancelledEvent;
use Illuminate\Contracts\Queue\ShouldQueue;

class UpdateInvoiceAndShippingWhenOrderCancelled implements ShouldQueue
{
    public function handle(OrderCancelledEvent $event): void
    {
        $event->order->invoice()->update(['status' => InvoiceStatusEnum::CANCELED]);
        $event->order->shipment()->update(['status' => ShippingStatusEnum::CANCELED]);
    }
}
