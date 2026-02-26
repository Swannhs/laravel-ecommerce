<?php

use App\Packages\Api\Http\Controllers\AuthenticationController;
use App\Packages\Api\Http\Controllers\DeviceTokenController;
use App\Packages\Api\Http\Controllers\ForgotPasswordController;
use App\Packages\Api\Http\Controllers\NotificationController;
use App\Packages\Api\Http\Controllers\ProfileController;
use App\Packages\Api\Http\Controllers\VerificationController;
use App\Packages\Page\Http\Controllers\API\PageController;
use Illuminate\Support\Facades\Route;

Route::prefix('v1')->group(function (): void {
    Route::post('register', [AuthenticationController::class, 'register']);
    Route::post('login', [AuthenticationController::class, 'login']);
    Route::post('email/check', [AuthenticationController::class, 'checkEmail']);
    Route::post('password/forgot', [ForgotPasswordController::class, 'sendResetLinkEmail']);
    Route::post('resend-verify-account-email', [VerificationController::class, 'resend']);

    Route::post('device-tokens', [DeviceTokenController::class, 'store']);

    Route::get('pages', [PageController::class, 'index']);
    Route::get('pages/{id}', [PageController::class, 'show'])->wherePrimaryKey();

    Route::middleware('auth:sanctum')->group(function (): void {
        Route::get('logout', [AuthenticationController::class, 'logout']);
        Route::get('me', [ProfileController::class, 'getProfile']);
        Route::put('me', [ProfileController::class, 'updateProfile']);
        Route::post('update/avatar', [ProfileController::class, 'updateAvatar']);
        Route::put('update/password', [ProfileController::class, 'updatePassword']);

        Route::get('settings', [ProfileController::class, 'getSettings']);
        Route::put('settings', [ProfileController::class, 'updateSettings']);

        Route::get('device-tokens', [DeviceTokenController::class, 'index']);
        Route::put('device-tokens/{id}', [DeviceTokenController::class, 'update'])->wherePrimaryKey();
        Route::delete('device-tokens/by-token', [DeviceTokenController::class, 'destroyByToken']);
        Route::delete('device-tokens/{id}', [DeviceTokenController::class, 'destroy'])->wherePrimaryKey();
        Route::post('device-tokens/{id}/deactivate', [DeviceTokenController::class, 'deactivate'])->wherePrimaryKey();

        Route::get('notifications', [NotificationController::class, 'index']);
        Route::get('notifications/stats', [NotificationController::class, 'getStats']);
        Route::post('notifications/mark-all-read', [NotificationController::class, 'markAllAsRead']);
        Route::post('notifications/{id}/read', [NotificationController::class, 'markAsRead'])->wherePrimaryKey();
        Route::post('notifications/{id}/clicked', [NotificationController::class, 'markAsClicked'])->wherePrimaryKey();
        Route::delete('notifications/{id}', [NotificationController::class, 'destroy'])->wherePrimaryKey();
    });
});
