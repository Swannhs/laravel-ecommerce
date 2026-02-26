<?php

namespace App\Packages\SeoHelper\Providers;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Events\UpdatedContentEvent;
use App\Packages\SeoHelper\Listeners\CreatedContentListener;
use App\Packages\SeoHelper\Listeners\DeletedContentListener;
use App\Packages\SeoHelper\Listeners\UpdatedContentListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        UpdatedContentEvent::class => [
            UpdatedContentListener::class,
        ],
        CreatedContentEvent::class => [
            CreatedContentListener::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
    ];
}
