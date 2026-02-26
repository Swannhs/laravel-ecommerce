<?php

namespace App\Packages\Menu\Providers;

use App\Core\Base\Events\DeletedContentEvent;
use App\Packages\Menu\Listeners\DeleteMenuNodeListener;
use App\Packages\Menu\Listeners\UpdateMenuNodeUrlListener;
use App\Packages\Slug\Events\UpdatedSlugEvent;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        UpdatedSlugEvent::class => [
            UpdateMenuNodeUrlListener::class,
        ],
        DeletedContentEvent::class => [
            DeleteMenuNodeListener::class,
        ],
    ];
}
