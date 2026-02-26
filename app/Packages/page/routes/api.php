<?php

use Illuminate\Support\Facades\Route;

Route::group([
    'middleware' => 'api',
    'prefix' => 'api/v1',
    'namespace' => 'App\Packages\Page\Http\Controllers\API',
], function (): void {
    Route::get('pages', 'PageController@index');
    Route::get('pages/{id}', 'PageController@show')->wherePrimaryKey();
});
