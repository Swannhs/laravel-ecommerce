<?php

namespace App\Core\ACL\Providers;

use App\Core\ACL\Commands\UserCreateCommand;
use App\Core\ACL\Commands\UserPasswordCommand;
use App\Core\Base\Supports\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            UserCreateCommand::class,
            UserPasswordCommand::class,
        ]);
    }
}
