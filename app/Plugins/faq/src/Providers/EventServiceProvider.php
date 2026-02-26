<?php

namespace App\Plugins\Faq\Providers;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Events\UpdatedContentEvent;
use App\Plugins\Faq\Listeners\DeletedContentListener;
use App\Plugins\Faq\Listeners\SaveFaqListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        UpdatedContentEvent::class => [
            SaveFaqListener::class,
        ],
        CreatedContentEvent::class => [
            SaveFaqListener::class,
        ],
        DeletedContentEvent::class => [
            DeletedContentListener::class,
        ],
    ];
}
