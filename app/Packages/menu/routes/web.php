<?php

use App\Core\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'App\Packages\Menu\Http\Controllers'], function (): void {
    AdminHelper::registerRoutes(function (): void {
        Route::group(['prefix' => 'menus', 'as' => 'menus.'], function (): void {
            Route::resource('', 'MenuController')->parameters(['' => 'menu']);

            Route::get('ajax/get-node', [
                'as' => 'get-node',
                'uses' => 'MenuController@getNode',
                'permission' => 'menus.index',
            ]);
        });
    });
});
