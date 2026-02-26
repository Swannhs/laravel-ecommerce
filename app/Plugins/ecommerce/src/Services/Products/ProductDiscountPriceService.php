<?php

namespace App\Plugins\Ecommerce\Services\Products;

use App\Plugins\Ecommerce\Models\Product;
use Closure;

class ProductDiscountPriceService extends ProductPriceHandlerService
{
    public function handle(Product $product, Closure $next)
    {
        $finalPrice = $product->getFinalPrice();
        $discountPrice = $product->getDiscountPrice();

        if ($discountPrice < $finalPrice) {
            $product->setFinalPrice($discountPrice);
        }

        return $next($product);
    }
}
