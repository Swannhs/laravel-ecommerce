<?php

namespace App\Plugins\Marketplace\Providers;

use App\Core\Base\Events\RenderingAdminWidgetEvent;
use App\Plugins\Ecommerce\Events\OrderCancelledEvent;
use App\Plugins\Ecommerce\Events\OrderCreated;
use App\Plugins\Marketplace\Events\WithdrawalRequested;
use App\Plugins\Marketplace\Listeners\ClearVendorCategoriesCacheOnSync;
use App\Plugins\Marketplace\Listeners\OrderCancelledEmailNotification;
use App\Plugins\Marketplace\Listeners\OrderCreatedEmailNotification;
use App\Plugins\Marketplace\Listeners\RegisterMarketplaceWidget;
use App\Plugins\Marketplace\Listeners\RenderingSiteMapListener;
use App\Plugins\Marketplace\Listeners\SaveVendorInformationListener;
use App\Plugins\Marketplace\Listeners\SendMailAfterVendorRegistered;
use App\Plugins\Marketplace\Listeners\WithdrawalRequestedNotification;
use App\Packages\Theme\Events\RenderingSiteMapEvent;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        Registered::class => [
            SaveVendorInformationListener::class,
            SendMailAfterVendorRegistered::class,
        ],
        RenderingSiteMapEvent::class => [
            RenderingSiteMapListener::class,
        ],
        OrderCreated::class => [
            OrderCreatedEmailNotification::class,
        ],
        OrderCancelledEvent::class => [
            OrderCancelledEmailNotification::class,
        ],
        WithdrawalRequested::class => [
            WithdrawalRequestedNotification::class,
        ],
        RenderingAdminWidgetEvent::class => [
            RegisterMarketplaceWidget::class,
        ],
        'eloquent.pivotAttached: App\Plugins\Ecommerce\Models\Product' => [
            ClearVendorCategoriesCacheOnSync::class,
        ],
        'eloquent.pivotDetached: App\Plugins\Ecommerce\Models\Product' => [
            ClearVendorCategoriesCacheOnSync::class,
        ],
        'eloquent.pivotUpdated: App\Plugins\Ecommerce\Models\Product' => [
            ClearVendorCategoriesCacheOnSync::class,
        ],
    ];
}
