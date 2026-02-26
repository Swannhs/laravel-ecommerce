<?php

namespace App\Packages\Assets\Facades;

use App\Packages\Assets\Assets;
use Illuminate\Support\Facades\Facade;

/**
 * @since 22/07/2015 11:25 PM
 */
class AssetsFacade extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return Assets::class;
    }
}
