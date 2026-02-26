<?php

namespace App\Plugins\LanguageAdvanced\Providers;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\UpdatedContentEvent;
use App\Plugins\LanguageAdvanced\Listeners\AddDefaultTranslations;
use App\Plugins\LanguageAdvanced\Listeners\AddRefLangToAdminBar;
use App\Plugins\LanguageAdvanced\Listeners\ClearCacheAfterUpdateData;
use App\Plugins\LanguageAdvanced\Listeners\PriorityLanguageAdvancedPluginListener;
use App\Plugins\LanguageAdvanced\Listeners\UpdatePermalinkSettingsForEachLanguage;
use App\Packages\PluginManagement\Events\ActivatedPluginEvent;
use App\Packages\Slug\Events\UpdatedPermalinkSettings;
use App\Packages\Theme\Events\RenderingAdminBar;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        CreatedContentEvent::class => [
            AddDefaultTranslations::class,
        ],
        UpdatedContentEvent::class => [
            ClearCacheAfterUpdateData::class,
        ],
        ActivatedPluginEvent::class => [
            PriorityLanguageAdvancedPluginListener::class,
        ],
        UpdatedPermalinkSettings::class => [
            UpdatePermalinkSettingsForEachLanguage::class,
        ],
        RenderingAdminBar::class => [
            AddRefLangToAdminBar::class,
        ],
    ];
}
