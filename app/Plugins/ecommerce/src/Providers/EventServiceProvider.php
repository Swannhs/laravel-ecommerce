<?php

namespace App\Plugins\Ecommerce\Providers;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Events\RenderingAdminWidgetEvent;
use App\Core\Base\Events\UpdatedContentEvent;
use App\Plugins\Ecommerce\Events\AbandonedCartReminderEvent;
use App\Plugins\Ecommerce\Events\CustomerEmailVerified;
use App\Plugins\Ecommerce\Events\OrderCancelledEvent;
use App\Plugins\Ecommerce\Events\OrderCompletedEvent;
use App\Plugins\Ecommerce\Events\OrderCreated;
use App\Plugins\Ecommerce\Events\OrderPaymentConfirmedEvent;
use App\Plugins\Ecommerce\Events\OrderPlacedEvent;
use App\Plugins\Ecommerce\Events\OrderReturnedEvent;
use App\Plugins\Ecommerce\Events\ProductFileUpdatedEvent;
use App\Plugins\Ecommerce\Events\ProductQuantityUpdatedEvent;
use App\Plugins\Ecommerce\Events\ProductVariationCreated;
use App\Plugins\Ecommerce\Events\ProductViewed;
use App\Plugins\Ecommerce\Events\ShippingStatusChanged;
use App\Plugins\Ecommerce\Facades\Cart;
use App\Plugins\Ecommerce\Listeners\AddLanguageForVariantsListener;
use App\Plugins\Ecommerce\Listeners\ClearShippingRuleCache;
use App\Plugins\Ecommerce\Listeners\GenerateInvoiceListener;
use App\Plugins\Ecommerce\Listeners\GenerateLicenseCodeAfterOrderCompleted;
use App\Plugins\Ecommerce\Listeners\HandleDiscountUsageOnOrderCompletion;
use App\Plugins\Ecommerce\Listeners\MarkCartAsRecovered;
use App\Plugins\Ecommerce\Listeners\OrderCancelledNotification;
use App\Plugins\Ecommerce\Listeners\OrderCreatedNotification;
use App\Plugins\Ecommerce\Listeners\OrderPaymentConfirmedNotification;
use App\Plugins\Ecommerce\Listeners\OrderReturnedNotification;
use App\Plugins\Ecommerce\Listeners\RegisterEcommerceWidget;
use App\Plugins\Ecommerce\Listeners\RenderingSiteMapListener;
use App\Plugins\Ecommerce\Listeners\SaveProductFaqListener;
use App\Plugins\Ecommerce\Listeners\SendAbandonedCartReminderEmail;
use App\Plugins\Ecommerce\Listeners\SendDigitalProductEmailAfterOrderCompleted;
use App\Plugins\Ecommerce\Listeners\SendMailsAfterCustomerEmailVerified;
use App\Plugins\Ecommerce\Listeners\SendMailsAfterCustomerRegistered;
use App\Plugins\Ecommerce\Listeners\SendProductFileUpdatedNotification;
use App\Plugins\Ecommerce\Listeners\SendProductReviewsMailAfterOrderCompleted;
use App\Plugins\Ecommerce\Listeners\SendShippingStatusChangedNotification;
use App\Plugins\Ecommerce\Listeners\SendWebhookWhenCartAbandoned;
use App\Plugins\Ecommerce\Listeners\SendWebhookWhenOrderCancelled;
use App\Plugins\Ecommerce\Listeners\SendWebhookWhenOrderCompleted;
use App\Plugins\Ecommerce\Listeners\SendWebhookWhenOrderPlaced;
use App\Plugins\Ecommerce\Listeners\SendWebhookWhenOrderUpdated;
use App\Plugins\Ecommerce\Listeners\SendWebhookWhenPaymentStatusUpdated;
use App\Plugins\Ecommerce\Listeners\SendWebhookWhenShippingStatusUpdated;
use App\Plugins\Ecommerce\Listeners\SyncProductSlug;
use App\Plugins\Ecommerce\Listeners\UpdateInvoiceAndShippingWhenOrderCancelled;
use App\Plugins\Ecommerce\Listeners\UpdateInvoiceWhenOrderCompleted;
use App\Plugins\Ecommerce\Listeners\UpdateProductStockStatus;
use App\Plugins\Ecommerce\Listeners\UpdateProductVariationInfo;
use App\Plugins\Ecommerce\Listeners\UpdateProductView;
use App\Plugins\Ecommerce\Services\HandleApplyCouponService;
use App\Plugins\Ecommerce\Services\HandleApplyProductCrossSaleService;
use App\Plugins\Ecommerce\Services\HandleRemoveCouponService;
use App\Packages\Slug\Events\UpdatedSlugEvent;
use App\Packages\Theme\Events\RenderingSiteMapEvent;
use Illuminate\Auth\Events\Logout;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Session\SessionManager;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        RenderingSiteMapEvent::class => [
            RenderingSiteMapListener::class,
        ],
        CreatedContentEvent::class => [
            AddLanguageForVariantsListener::class,
            ClearShippingRuleCache::class,
            SaveProductFaqListener::class,
            [SyncProductSlug::class, 'handleCreatedContent'],
        ],
        UpdatedContentEvent::class => [
            AddLanguageForVariantsListener::class,
            ClearShippingRuleCache::class,
            SaveProductFaqListener::class,
            SendWebhookWhenOrderUpdated::class,
            [SyncProductSlug::class, 'handleUpdatedContent'],
        ],
        UpdatedSlugEvent::class => [
            [SyncProductSlug::class, 'handleUpdatedSlug'],
        ],
        DeletedContentEvent::class => [
            ClearShippingRuleCache::class,
        ],
        Registered::class => [
            SendMailsAfterCustomerRegistered::class,
        ],
        CustomerEmailVerified::class => [
            SendMailsAfterCustomerEmailVerified::class,
        ],
        OrderPlacedEvent::class => [
            SendWebhookWhenOrderPlaced::class,
            GenerateInvoiceListener::class,
            OrderCreatedNotification::class,
            MarkCartAsRecovered::class,
            HandleDiscountUsageOnOrderCompletion::class,
        ],
        OrderCreated::class => [
            GenerateInvoiceListener::class,
            OrderCreatedNotification::class,
        ],
        ProductQuantityUpdatedEvent::class => [
            UpdateProductStockStatus::class,
        ],
        OrderCompletedEvent::class => [
            SendDigitalProductEmailAfterOrderCompleted::class,
            SendProductReviewsMailAfterOrderCompleted::class,
            GenerateLicenseCodeAfterOrderCompleted::class,
            UpdateInvoiceWhenOrderCompleted::class,
            SendWebhookWhenOrderCompleted::class,
        ],
        ProductViewed::class => [
            UpdateProductView::class,
        ],
        ShippingStatusChanged::class => [
            SendShippingStatusChangedNotification::class,
            SendWebhookWhenShippingStatusUpdated::class,
        ],
        RenderingAdminWidgetEvent::class => [
            RegisterEcommerceWidget::class,
        ],
        OrderPaymentConfirmedEvent::class => [
            OrderPaymentConfirmedNotification::class,
            SendWebhookWhenPaymentStatusUpdated::class,
        ],
        OrderCancelledEvent::class => [
            OrderCancelledNotification::class,
            UpdateInvoiceAndShippingWhenOrderCancelled::class,
            SendWebhookWhenOrderCancelled::class,
        ],
        OrderReturnedEvent::class => [
            OrderReturnedNotification::class,
        ],
        ProductVariationCreated::class => [
            UpdateProductVariationInfo::class,
        ],
        ProductFileUpdatedEvent::class => [
            SendProductFileUpdatedNotification::class,
        ],
        AbandonedCartReminderEvent::class => [
            SendAbandonedCartReminderEmail::class,
            SendWebhookWhenCartAbandoned::class,
        ],
    ];

    public function boot(): void
    {
        $events = $this->app['events'];

        $events->listen(
            ['cart.added', 'cart.updated'],
            fn () => $this->app->make(HandleApplyProductCrossSaleService::class)->handle()
        );

        $events->listen(
            ['cart.added', 'cart.removed', 'cart.stored', 'cart.restored', 'cart.updated'],
            function ($cart = null): void {
                $coupon = session('applied_coupon_code');
                if ($coupon) {
                    $this->app->make(HandleRemoveCouponService::class)->execute();
                    if (Cart::count() || ($cart instanceof \App\Plugins\Ecommerce\Cart\Cart && $cart->count())) {
                        $this->app->make(HandleApplyCouponService::class)->execute($coupon);
                    }
                }
            }
        );

        $this->app['events']->listen(Logout::class, function (): void {
            if (get_ecommerce_setting('cart_destroy_on_logout', false)) {
                $this->app->make(SessionManager::class)->forget('cart');
            }
        });
    }
}
