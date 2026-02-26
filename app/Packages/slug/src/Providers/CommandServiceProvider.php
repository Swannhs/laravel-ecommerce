<?php

namespace App\Packages\Slug\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Packages\Slug\Commands\ChangeSlugPrefixCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            ChangeSlugPrefixCommand::class,
        ]);
    }
}
