<?php

namespace App\Plugins\Ecommerce\Facades;

use App\Plugins\Ecommerce\Supports\DiscountSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \App\Plugins\Ecommerce\Supports\DiscountSupport setCustomerId(string|int $customerId)
 * @method static string|int getCustomerId()
 * @method static \App\Plugins\Ecommerce\Models\Discount|null promotionForProduct(array $productIds)
 * @method static \Illuminate\Support\Collection getAvailablePromotions(bool $forProductSingle = true)
 * @method static void afterOrderPlaced(string $couponCode, string|int|null $customerId = 0)
 * @method static void afterOrderCancelled(string $couponCode, string|int|null $customerId = 0)
 *
 * @see \App\Plugins\Ecommerce\Supports\DiscountSupport
 */
class Discount extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return DiscountSupport::class;
    }
}
