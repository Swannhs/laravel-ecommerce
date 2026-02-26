<?php

namespace App\Plugins\Marketplace\Services;

use App\Plugins\Ecommerce\Facades\Cart;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use Exception;

class CartValidateSameStore
{
    public function handle(?Product $originalProduct = null, ?string $errorMessage = null): void
    {
        if (! MarketplaceHelper::isSingleVendorCheckout()) {
            return;
        }

        $cart = Cart::instance('cart');

        if ($cart->isEmpty()) {
            return;
        }

        $products = $cart->products();

        if ($products->isEmpty()) {
            return;
        }

        if ($originalProduct) {
            $products->map(function (Product $product) use ($errorMessage, $originalProduct): void {
                if ($product->original_product->store_id !== $originalProduct->original_product->store_id) {
                    throw new Exception($errorMessage);
                }
            });

            return;
        }

        $storeIds = [];

        foreach ($products as $product) {
            $storeIds[] = $product->original_product->store_id;
        }

        $storeIds = array_unique($storeIds);

        if (count($storeIds) > 1) {
            throw new Exception($errorMessage);
        }
    }
}
