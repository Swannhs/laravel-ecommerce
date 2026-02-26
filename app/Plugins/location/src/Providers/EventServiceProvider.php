<?php

namespace App\Plugins\Location\Providers;

use App\Plugins\Location\Events\ImportedCityEvent;
use App\Plugins\Location\Events\ImportedCountryEvent;
use App\Plugins\Location\Events\ImportedStateEvent;
use App\Plugins\Location\Listeners\CreateCityTranslationListener;
use App\Plugins\Location\Listeners\CreateCountryTranslationListener;
use App\Plugins\Location\Listeners\CreateStateTranslationListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as BaseServiceProvider;

class EventServiceProvider extends BaseServiceProvider
{
    protected $listen = [
        ImportedCountryEvent::class => [
            CreateCountryTranslationListener::class,
        ],
        ImportedStateEvent::class => [
            CreateStateTranslationListener::class,
        ],
        ImportedCityEvent::class => [
            CreateCityTranslationListener::class,
        ],
    ];
}
