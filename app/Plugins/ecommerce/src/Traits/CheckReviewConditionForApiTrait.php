<?php

namespace App\Plugins\Ecommerce\Traits;

use App\Plugins\Ecommerce\Enums\OrderStatusEnum;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Order;
use App\Plugins\Ecommerce\Models\Review;
use Illuminate\Http\Request;

trait CheckReviewConditionForApiTrait
{
    protected function checkReviewCondition(int|string $productId, Request $request): array
    {
        $user = $request->user();

        if (! $user) {
            return [
                'error' => false,
            ];
        }

        $customerId = $user->id;

        if (Review::hasUserReviewed($customerId, $productId)) {
            return [
                'error' => true,
                'message' => __('You have reviewed this product already!'),
            ];
        }

        if (EcommerceHelper::onlyAllowCustomersPurchasedToReview()) {
            $order = Order::query()
                ->where([
                    'user_id' => $user->id,
                    'status' => OrderStatusEnum::COMPLETED,
                ])
                ->join('ec_order_product', function ($query) use ($productId): void {
                    $query
                        ->on('ec_order_product.order_id', 'ec_orders.id')
                        ->leftJoin('ec_product_variations', 'ec_product_variations.product_id', 'ec_order_product.product_id')
                        ->where(function ($query) use ($productId): void {
                            $query->where('ec_product_variations.configurable_product_id', $productId)
                            ->orWhere('ec_order_product.product_id', $productId);
                        });
                })
                ->exists();

            if (! $order) {
                return [
                    'error' => true,
                    'message' => __('Please purchase the product for a review!'),
                ];
            }
        }

        return [
            'error' => false,
        ];
    }
}
