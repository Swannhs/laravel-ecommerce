<?php

namespace App\Plugins\Backup\Providers;

use App\Plugins\Backup\Commands\BackupCleanCommand;
use App\Plugins\Backup\Commands\BackupCreateCommand;
use App\Plugins\Backup\Commands\BackupListCommand;
use App\Plugins\Backup\Commands\BackupRemoveCommand;
use App\Plugins\Backup\Commands\BackupRestoreCommand;
use App\Core\Base\Supports\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            BackupCreateCommand::class,
            BackupRestoreCommand::class,
            BackupRemoveCommand::class,
            BackupListCommand::class,
            BackupCleanCommand::class,
        ]);
    }
}
