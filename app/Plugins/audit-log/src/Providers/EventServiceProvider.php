<?php

namespace App\Plugins\AuditLog\Providers;

use App\Plugins\AuditLog\Events\AuditHandlerEvent;
use App\Plugins\AuditLog\Listeners\AuditHandlerListener;
use App\Plugins\AuditLog\Listeners\CreatedContentListener;
use App\Plugins\AuditLog\Listeners\CustomerLoginListener;
use App\Plugins\AuditLog\Listeners\CustomerLogoutListener;
use App\Plugins\AuditLog\Listeners\CustomerRegistrationListener;
use App\Plugins\AuditLog\Listeners\DeletedContentListener;
use App\Plugins\AuditLog\Listeners\LoginListener;
use App\Plugins\AuditLog\Listeners\UpdatedContentListener;
use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Events\UpdatedContentEvent;
use Illuminate\Auth\Events\Login;
use Illuminate\Auth\Events\Logout;
use Illuminate\Auth\Events\Registered;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        AuditHandlerEvent::class => [
            AuditHandlerListener::class,
        ],
        Login::class => [
            LoginListener::class,
            CustomerLoginListener::class,
        ],
        Logout::class => [
            CustomerLogoutListener::class,
        ],
        Registered::class => [
            CustomerRegistrationListener::class,
        ],
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
