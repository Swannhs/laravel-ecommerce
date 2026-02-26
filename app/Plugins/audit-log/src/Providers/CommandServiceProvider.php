<?php

namespace App\Plugins\AuditLog\Providers;

use App\Plugins\AuditLog\Commands\ActivityLogClearCommand;
use App\Plugins\AuditLog\Commands\CleanOldLogsCommand;
use App\Core\Base\Supports\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            ActivityLogClearCommand::class,
            CleanOldLogsCommand::class,
        ]);
    }
}
