<?php

namespace App\Core\ACL\Providers;

use App\Core\ACL\Events\RoleAssignmentEvent;
use App\Core\ACL\Events\RoleUpdateEvent;
use App\Core\ACL\Listeners\LoginListener;
use App\Core\ACL\Listeners\RoleAssignmentListener;
use App\Core\ACL\Listeners\RoleUpdateListener;
use Illuminate\Auth\Events\Login;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        RoleUpdateEvent::class => [
            RoleUpdateListener::class,
        ],
        RoleAssignmentEvent::class => [
            RoleAssignmentListener::class,
        ],
        Login::class => [
            LoginListener::class,
        ],
    ];
}
