<?php

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Http\Controllers\Fronts\WishlistController;
use App\Plugins\Ecommerce\Http\Middleware\CheckWishlistEnabledMiddleware;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function (): void {
    Route::middleware(CheckWishlistEnabledMiddleware::class)
        ->controller(WishlistController::class)
        ->prefix(EcommerceHelper::getPageSlug('wishlist'))
        ->name('public.')
        ->group(function (): void {
            Route::get('/{code?}', 'index')->name('wishlist');
            Route::post('{productId}', 'store')->name('wishlist.add')->wherePrimaryKey('productId');
            Route::delete('{productId}', 'destroy')->name('wishlist.remove')->wherePrimaryKey('productId');
        });
});
