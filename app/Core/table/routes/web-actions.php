<?php

use App\Core\Table\Http\Controllers\TableBulkActionController;
use App\Core\Table\Http\Controllers\TableBulkChangeController;
use App\Core\Table\Http\Controllers\TableColumnVisibilityController;
use App\Core\Table\Http\Controllers\TableFilterController;
use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'tables', 'permission' => false, 'as' => 'table.'], function (): void {
    Route::group(['prefix' => 'bulk-changes', 'as' => 'bulk-change.'], function (): void {
        Route::get('data', [TableBulkChangeController::class, 'index'])->name('data');
        Route::post('save', [TableBulkChangeController::class, 'update'])->name('save');
    });

    Route::group(['prefix' => 'bulk-actions', 'as' => 'bulk-action.'], function (): void {
        Route::post('/', [TableBulkActionController::class, '__invoke'])->name('dispatch');
    });

    Route::group(['prefix' => 'filters', 'as' => 'filter.'], function (): void {
        Route::get('/', [TableFilterController::class, '__invoke'])->name('input');
    });

    Route::group(['middleware' => 'preventDemo', 'prefix' => 'columns-visibility'], function (): void {
        Route::put('/', [TableColumnVisibilityController::class, 'update'])->name('update-columns-visibility');
    });
});
