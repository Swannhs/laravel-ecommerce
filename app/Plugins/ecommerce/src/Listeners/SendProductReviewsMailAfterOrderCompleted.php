<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Core\Base\Facades\EmailHandler;
use App\Plugins\Ecommerce\Events\OrderCompletedEvent;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Order;
use App\Plugins\Ecommerce\Repositories\Interfaces\ProductInterface;

class SendProductReviewsMailAfterOrderCompleted
{
    public function handle(OrderCompletedEvent $event): void
    {
        $mailer = EmailHandler::setModule(ECOMMERCE_MODULE_SCREEN_NAME);

        if (EcommerceHelper::isReviewEnabled() && $mailer->templateEnabled('review_products')) {
            $order = $event->order;

            if ($order instanceof Order && ($customer = $order->user) && $customer->id) {
                $products = app(ProductInterface::class)->productsNeedToReviewByCustomer($customer->id, 12, [$order->id]);

                if ($products->count() && $products->loadMissing(['slugable'])) {
                    $mailer
                        ->setVariableValues([
                            'customer_name' => $customer->name,
                            'product_review_list' => view('plugins/ecommerce::emails.partials.product-review-list', compact('products'))->render(),
                            'order_id' => $order->code,
                        ])
                        ->sendUsingTemplate('review_products', $customer->email);
                }
            }
        }
    }
}
