<?php

namespace App\Packages\PluginManagement\Providers;

use App\Core\Base\Events\SeederPrepared;
use App\Core\Base\Events\SystemUpdateDBMigrated;
use App\Core\Base\Events\SystemUpdatePublished;
use App\Core\Base\Listeners\ClearDashboardMenuCaches;
use App\Packages\PluginManagement\Events\ActivatedPluginEvent;
use App\Packages\PluginManagement\Events\UpdatedPluginEvent;
use App\Packages\PluginManagement\Events\UpdatingPluginEvent;
use App\Packages\PluginManagement\Listeners\ActivateAllPlugins;
use App\Packages\PluginManagement\Listeners\ClearPluginCaches;
use App\Packages\PluginManagement\Listeners\CoreUpdatePluginsDB;
use App\Packages\PluginManagement\Listeners\PublishPluginAssets;
use Illuminate\Contracts\Database\Events\MigrationEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        MigrationEvent::class => [
            ClearPluginCaches::class,
        ],
        SystemUpdateDBMigrated::class => [
            CoreUpdatePluginsDB::class,
        ],
        SystemUpdatePublished::class => [
            PublishPluginAssets::class,
        ],
        SeederPrepared::class => [
            ActivateAllPlugins::class,
        ],
        ActivatedPluginEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
        UpdatingPluginEvent::class => [
            ClearPluginCaches::class,
        ],
        UpdatedPluginEvent::class => [
            ClearDashboardMenuCaches::class,
        ],
    ];
}
