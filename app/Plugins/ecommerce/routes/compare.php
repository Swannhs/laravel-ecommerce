<?php

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Http\Controllers\Fronts\CompareController;
use App\Plugins\Ecommerce\Http\Middleware\CheckCompareEnabledMiddleware;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function (): void {
    Route::middleware(CheckCompareEnabledMiddleware::class)
        ->controller(CompareController::class)
        ->prefix(EcommerceHelper::getPageSlug('compare'))
        ->name('public.')
        ->group(function (): void {
            Route::get('/', 'index')->name('compare');
            Route::post('{productId}', 'store')->name('compare.add')->wherePrimaryKey('productId');
            Route::delete('{productId}', 'destroy')->name('compare.remove')->wherePrimaryKey('productId');
        });
});
