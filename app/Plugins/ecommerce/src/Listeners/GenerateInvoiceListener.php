<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Plugins\Ecommerce\Events\OrderCreated;
use App\Plugins\Ecommerce\Events\OrderPlacedEvent;
use App\Plugins\Ecommerce\Facades\InvoiceHelper;
use Illuminate\Contracts\Queue\ShouldQueue;

class GenerateInvoiceListener implements ShouldQueue
{
    public function handle(OrderPlacedEvent|OrderCreated $event): void
    {
        $order = $event->order;

        InvoiceHelper::store($order);
    }
}
