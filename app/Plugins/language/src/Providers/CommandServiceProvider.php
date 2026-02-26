<?php

namespace App\Plugins\Language\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Plugins\Language\Commands\AddLanguageCommand;
use App\Plugins\Language\Commands\RemoveLanguageCommand;
use App\Plugins\Language\Commands\RouteCacheCommand;
use App\Plugins\Language\Commands\RouteClearCommand;
use App\Plugins\Language\Commands\RouteTranslationsListCommand;
use Illuminate\Foundation\Console\RouteCacheCommand as BaseRouteCacheCommand;
use Illuminate\Foundation\Console\RouteClearCommand as BaseRouteClearCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            RouteTranslationsListCommand::class,
            AddLanguageCommand::class,
            RemoveLanguageCommand::class,
        ]);

        $this->app->extend(BaseRouteCacheCommand::class, function () {
            return new RouteCacheCommand($this->app['files']);
        });

        $this->app->extend(BaseRouteClearCommand::class, function () {
            return new RouteClearCommand($this->app['files']);
        });
    }
}
