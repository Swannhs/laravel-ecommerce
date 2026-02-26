<?php

namespace App\Plugins\Contact\Providers;

use App\Plugins\Contact\Events\SentContactEvent;
use App\Plugins\Contact\Listeners\SendContactEmailListener;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        SentContactEvent::class => [
            SendContactEmailListener::class,
        ],
    ];
}
