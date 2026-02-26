<?php

namespace App\Plugins\Language\Providers;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Events\UpdatedContentEvent;
use App\Packages\Installer\Events\InstallerFinished;
use App\Plugins\Language\Listeners\ActivatedPluginListener;
use App\Plugins\Language\Listeners\AddHrefLangListener;
use App\Plugins\Language\Listeners\CopyThemeOptions;
use App\Plugins\Language\Listeners\CopyThemeWidgets;
use App\Plugins\Language\Listeners\CreatedContentListener;
use App\Plugins\Language\Listeners\CreateSelectedLanguageWhenInstallationFinished;
use App\Plugins\Language\Listeners\DeletedContentListener;
use App\Plugins\Language\Listeners\ThemeRemoveListener;
use App\Plugins\Language\Listeners\UpdatedContentListener;
use App\Packages\PluginManagement\Events\ActivatedPluginEvent;
use App\Packages\Theme\Events\RenderingSingleEvent;
use App\Packages\Theme\Events\ThemeRemoveEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        UpdatedContentEvent::class => [
            UpdatedContentListener::class,
        ],
        CreatedContentEvent::class => [
            CreatedContentListener::class,
            CopyThemeOptions::class,
            CopyThemeWidgets::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
        ThemeRemoveEvent::class => [
            ThemeRemoveListener::class,
        ],
        ActivatedPluginEvent::class => [
            ActivatedPluginListener::class,
        ],
        RenderingSingleEvent::class => [
            AddHrefLangListener::class,
        ],
        InstallerFinished::class => [
            CreateSelectedLanguageWhenInstallationFinished::class,
        ],
    ];
}
