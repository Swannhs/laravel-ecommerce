<?php

use App\Packages\Theme\Facades\Theme;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function (): void {
    Route::group(['namespace' => 'App\Plugins\Paystack\Http\Controllers'], function (): void {
        Route::get('paystack/payment/callback', [
            'as' => 'paystack.payment.callback',
            'uses' => 'PaystackController@getPaymentStatus',
        ]);
    });
});
