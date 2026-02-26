<?php

namespace App\Plugins\Ecommerce\Services;

use App\Plugins\Ecommerce\Facades\Cart;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Ecommerce\Models\SharedWishlist;
use Carbon\Carbon;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Str;

class ProductWishlistService
{
    public function handle(Product $product): bool
    {
        $isAdded = false;

        $guard = auth('customer');

        if (! $guard->check()) {
            $instance = Cart::instance('wishlist');

            $wishlist = $instance->search(fn ($cartItem) => $cartItem->id == $product->getKey());

            if ($wishlist->isEmpty()) {
                $instance
                    ->add($product->getKey(), $product->name, 1, $product->price()->getPrice(false))
                    ->associate(Product::class);

                $isAdded = true;
            } else {
                $wishlist->each(fn ($cartItem, $rowId) => $instance->remove($rowId));
            }

            $productIds = Cart::instance('wishlist')->content()->pluck('id');
        } else {
            /** @var Customer $customer */
            $customer = $guard->user();

            $data = [
                'product_id' => $product->getKey(),
            ];

            if (is_added_to_wishlist($product->getKey())) {
                $customer->wishlist()->where($data)->delete();
            } else {
                $customer->wishlist()->create($data);

                $isAdded = true;
            }

            $productIds = $customer->wishlist()->pluck('product_id');
        }

        if (EcommerceHelper::isWishlistSharingEnabled()) {
            if (! $code = EcommerceHelper::getWishlistCode()) {
                $code = Str::random(8);
                Cookie::queue('ec_wishlist_code', $code, Carbon::now()->addDays(365)->timestamp);
            }

            SharedWishlist::query()->updateOrCreate(
                ['code' => $code],
                ['product_ids' => $productIds->unique()->all()]
            );
        }

        return $isAdded;
    }
}
