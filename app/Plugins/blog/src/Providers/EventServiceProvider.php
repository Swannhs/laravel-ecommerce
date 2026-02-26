<?php

namespace App\Plugins\Blog\Providers;

use App\Plugins\Blog\Listeners\RenderingSiteMapListener;
use App\Packages\Theme\Events\RenderingSiteMapEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        RenderingSiteMapEvent::class => [
            RenderingSiteMapListener::class,
        ],
    ];
}
