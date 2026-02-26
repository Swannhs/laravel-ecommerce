<?php

use App\Plugins\Ads\Http\Controllers\API\AdsController;
use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
    'prefix' => 'api/v1/ads',
    'namespace' => 'App\Plugins\Ads\Http\Controllers\API',
], function (): void {
    Route::get('/', [AdsController::class, 'index']);
});
