<?php

namespace App\Packages\Slug\Providers;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Events\FinishedSeederEvent;
use App\Core\Base\Events\SeederPrepared;
use App\Core\Base\Events\UpdatedContentEvent;
use App\Packages\Slug\Listeners\CreatedContentListener;
use App\Packages\Slug\Listeners\CreateMissingSlug;
use App\Packages\Slug\Listeners\DeletedContentListener;
use App\Packages\Slug\Listeners\TruncateSlug;
use App\Packages\Slug\Listeners\UpdatedContentListener;
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
        SeederPrepared::class => [
            TruncateSlug::class,
        ],
        FinishedSeederEvent::class => [
            CreateMissingSlug::class,
        ],
    ];
}
