<?php

namespace App\Packages\Theme\Providers;

use App\Core\Base\Events\CacheCleared;
use App\Core\Base\Events\FormRendering;
use App\Core\Base\Events\SeederPrepared;
use App\Core\Base\Events\SystemUpdateDBMigrated;
use App\Core\Base\Events\SystemUpdatePublished;
use App\Packages\Theme\Listeners\AddFormJsValidation;
use App\Packages\Theme\Listeners\ClearThemeCache;
use App\Packages\Theme\Listeners\CoreUpdateThemeDB;
use App\Packages\Theme\Listeners\PublishThemeAssets;
use App\Packages\Theme\Listeners\SetDefaultTheme;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        SystemUpdateDBMigrated::class => [
            CoreUpdateThemeDB::class,
        ],
        SystemUpdatePublished::class => [
            PublishThemeAssets::class,
        ],
        SeederPrepared::class => [
            SetDefaultTheme::class,
        ],
        FormRendering::class => [
            AddFormJsValidation::class,
        ],
        CacheCleared::class => [
            ClearThemeCache::class,
        ],
    ];
}
