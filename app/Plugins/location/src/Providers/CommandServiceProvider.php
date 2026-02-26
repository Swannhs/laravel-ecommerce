<?php

namespace App\Plugins\Location\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Plugins\Location\Commands\MigrateLocationCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if ($this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            MigrateLocationCommand::class,
        ]);
    }
}
