<?php

use App\Core\Base\Http\Middleware\RequiresJsonRequestMiddleware;
use App\Plugins\Marketplace\Http\Controllers\Fronts\BecomeVendorController;
use App\Plugins\Marketplace\Http\Controllers\Fronts\ContactStoreController;
use App\Plugins\Marketplace\Http\Controllers\Fronts\PublicStoreController;
use App\Plugins\Marketplace\Models\Store;
use App\Packages\Slug\Facades\SlugHelper;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Route::group([
    'namespace' => 'App\Plugins\Marketplace\Http\Controllers\Fronts',
], function (): void {
    Route::group(['middleware' => ['web', 'core']], function (): void {
        Route::post('ajax/stores/check-store-url', [PublicStoreController::class, 'checkStoreUrl'])
            ->name('public.ajax.check-store-url');
    });

    Theme::registerRoutes(function (): void {
        $slugPrefix = SlugHelper::getPrefix(Store::class, 'stores');

        Route::get($slugPrefix, [PublicStoreController::class, 'getStores'])->name('public.stores');
        Route::get("$slugPrefix/{slug}", [PublicStoreController::class, 'getStore'])->name('public.store');

        Route::prefix('ajax/stores')
            ->name('public.ajax.')
            ->middleware(RequiresJsonRequestMiddleware::class)
            ->group(function (): void {
                Route::post('{id}/contact', [ContactStoreController::class, 'store'])->name('stores.contact');
            });

        Route::middleware('customer')->prefix('customer/become-vendor')->name('marketplace.vendor.')->group(
            function (): void {
                Route::get('/', [BecomeVendorController::class, 'index'])->name('become-vendor');
                Route::post('/', [BecomeVendorController::class, 'store'])->name('become-vendor.post');
                Route::put('/', [BecomeVendorController::class, 'update'])->name('become-vendor.update');
                Route::get('download-certificate', [BecomeVendorController::class, 'downloadCertificate'])->name(
                    'become-vendor.download-certificate'
                );
                Route::get('download-government-id', [BecomeVendorController::class, 'downloadGovernmentId'])->name(
                    'become-vendor.download-government-id'
                );
            }
        );
    });
});
