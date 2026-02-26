<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Events\UpdatedContentEvent;
use App\Plugins\Ecommerce\Models\Shipping;
use App\Plugins\Ecommerce\Models\ShippingRule;
use App\Plugins\Ecommerce\Services\HandleShippingFeeService;

class ClearShippingRuleCache
{
    public function __construct(protected HandleShippingFeeService $shippingFeeService)
    {
    }

    public function handle(CreatedContentEvent|UpdatedContentEvent|DeletedContentEvent $event): void
    {
        if (! in_array(get_class($event->data), [Shipping::class, ShippingRule::class])) {
            return;
        }

        $this->shippingFeeService->clearCache();
    }
}
