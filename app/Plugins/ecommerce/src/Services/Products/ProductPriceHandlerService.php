<?php

namespace App\Plugins\Ecommerce\Services\Products;

use App\Plugins\Ecommerce\Models\Product;
use Closure;

abstract class ProductPriceHandlerService
{
    public function handle(Product $product, Closure $next)
    {
        return $next($product);
    }
}
