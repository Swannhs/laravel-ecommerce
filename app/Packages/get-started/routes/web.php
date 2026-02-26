<?php

use App\Core\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'App\Packages\GetStarted\Http\Controllers'], function (): void {
    AdminHelper::registerRoutes(function (): void {
        Route::group(['prefix' => 'get-started'], function (): void {
            Route::post('save', [
                'as' => 'get-started.save',
                'uses' => 'GetStartedController@save',
                'permission' => false,
                'middleware' => 'preventDemo',
            ]);
        });
    });
});
