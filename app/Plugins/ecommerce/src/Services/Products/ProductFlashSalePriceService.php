<?php

namespace App\Plugins\Ecommerce\Services\Products;

use App\Plugins\Ecommerce\Facades\FlashSale;
use App\Plugins\Ecommerce\Models\Product;
use Closure;

class ProductFlashSalePriceService extends ProductPriceHandlerService
{
    public function handle(Product $product, Closure $next)
    {
        if (! FlashSale::isEnabled()) {
            return $next($product);
        }

        $finalPrice = (float) ($product->getFinalPrice() ?: $product->price);
        $flashSalePrice = (float) $product->getFlashSalePrice();

        if ($flashSalePrice < $finalPrice) {
            $product->setOriginalPrice($flashSalePrice);
            $product->setFinalPrice($flashSalePrice);
        } else {
            $product->setOriginalPrice($finalPrice);
        }

        return $next($product);
    }
}
