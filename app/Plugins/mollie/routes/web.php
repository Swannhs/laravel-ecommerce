<?php

use App\Plugins\Mollie\Http\Controllers\MollieController;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Support\Facades\Route;

Theme::registerRoutes(function (): void {
    Route::post('mollie/payment/webhook/{token}', [MollieController::class, 'webhook'])
        ->withoutMiddleware([VerifyCsrfToken::class])
        ->name('mollie.payment.webhook');
}, ['core']);
