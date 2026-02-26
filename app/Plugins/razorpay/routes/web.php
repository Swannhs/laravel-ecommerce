<?php

use App\Plugins\Razorpay\Http\Controllers\RazorpayController;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function (): void {
    Route::prefix('payment/razorpay')->name('payments.razorpay.')
        ->withoutMiddleware([VerifyCsrfToken::class])
        ->group(function (): void {
            Route::post('callback/{token}', [RazorpayController::class, 'callback'])->name('callback');

            Route::post('webhook', [RazorpayController::class, 'webhook'])
                ->name('webhook');
        });
}, ['core']);
