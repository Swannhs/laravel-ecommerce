<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Plugins\Ecommerce\Enums\InvoiceStatusEnum;
use App\Plugins\Ecommerce\Events\OrderCompletedEvent;
use Illuminate\Contracts\Queue\ShouldQueue;

class UpdateInvoiceWhenOrderCompleted implements ShouldQueue
{
    public function handle(OrderCompletedEvent $event): void
    {
        $event->order->invoice()->update(['status' => InvoiceStatusEnum::COMPLETED]);
    }
}
