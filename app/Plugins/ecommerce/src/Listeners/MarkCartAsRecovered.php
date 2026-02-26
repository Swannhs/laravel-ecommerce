<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Plugins\Ecommerce\Events\OrderPlacedEvent;
use App\Plugins\Ecommerce\Services\AbandonedCartService;

class MarkCartAsRecovered
{
    public function __construct(
        protected AbandonedCartService $abandonedCartService
    ) {
    }

    public function handle(OrderPlacedEvent $event): void
    {
        $this->abandonedCartService->markCartAsRecovered($event->order);
    }
}
