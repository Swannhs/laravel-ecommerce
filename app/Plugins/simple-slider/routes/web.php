<?php

use App\Core\Base\Facades\AdminHelper;
use Illuminate\Support\Facades\Route;

Route::group(['namespace' => 'App\Plugins\SimpleSlider\Http\Controllers'], function (): void {
    AdminHelper::registerRoutes(function (): void {
        Route::group(['prefix' => 'simple-sliders', 'as' => 'simple-slider.'], function (): void {
            Route::resource('', 'SimpleSliderController')->parameters(['' => 'simple-slider']);

            Route::post('sorting', [
                'as' => 'sorting',
                'uses' => 'SimpleSliderController@postSorting',
                'permission' => 'simple-slider.edit',
            ]);
        });

        Route::group(['prefix' => 'simple-slider-items', 'as' => 'simple-slider-item.'], function (): void {
            Route::resource('', 'SimpleSliderItemController')->except([
                'index',
            ])->parameters(['' => 'simple-slider-item']);

            Route::match(['GET', 'POST'], 'list/{id}', [
                'as' => 'index',
                'uses' => 'SimpleSliderItemController@index',
            ])->wherePrimaryKey();
        });

    });
});
