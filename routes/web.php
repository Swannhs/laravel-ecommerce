<?php

use App\Core\Base\Facades\AdminHelper;
use App\Core\Base\Http\Middleware\DisableInDemoModeMiddleware;
use App\Packages\DataSynchronize\Http\Controllers\DataSynchronizeController;
use App\Packages\DataSynchronize\Http\Controllers\UploadController;
use App\Packages\Menu\Http\Controllers\MenuController;
use App\Packages\Page\Http\Controllers\PageController;
use Illuminate\Support\Facades\Route;

AdminHelper::registerRoutes(function (): void {
    Route::group(['permission' => 'tools.data-synchronize'], function (): void {
        Route::get('tools/data-synchronize', [DataSynchronizeController::class, 'index'])
            ->name('tools.data-synchronize');

        Route::prefix('data-synchronize')->name('data-synchronize.')->group(function (): void {
            Route::post('upload', [UploadController::class, '__invoke'])
                ->middleware(DisableInDemoModeMiddleware::class)
                ->name('upload');
        });
    });
});

AdminHelper::registerRoutes(function (): void {
    Route::group(['prefix' => 'pages', 'as' => 'pages.'], function (): void {
        Route::resource('', PageController::class)->parameters(['' => 'page']);

        Route::get('{page}/visual-builder', [
            'as' => 'visual-builder',
            'uses' => [PageController::class, 'visualBuilder'],
            'permission' => 'pages.edit',
        ]);

        Route::match(['get', 'post'], '{page}/preview', [
            'as' => 'preview',
            'uses' => [PageController::class, 'preview'],
            'permission' => 'pages.edit',
        ]);

        Route::post('{page}/visual-builder/save', [
            'as' => 'visual-builder.save',
            'uses' => [PageController::class, 'saveVisualBuilder'],
            'permission' => 'pages.edit',
        ]);

        Route::post('visual-builder/render-items', [
            'as' => 'visual-builder.render-items',
            'uses' => [PageController::class, 'renderShortcodeItems'],
            'permission' => 'pages.edit',
        ]);

        Route::post('visual-builder/render-types', [
            'as' => 'visual-builder.render-types',
            'uses' => [PageController::class, 'renderShortcodeTypes'],
            'permission' => 'pages.edit',
        ]);
    });
});

AdminHelper::registerRoutes(function (): void {
    Route::group(['prefix' => 'menus', 'as' => 'menus.'], function (): void {
        Route::resource('', MenuController::class)->parameters(['' => 'menu']);

        Route::get('ajax/get-node', [
            'as' => 'get-node',
            'uses' => [MenuController::class, 'getNode'],
            'permission' => 'menus.index',
        ]);
    });
});
