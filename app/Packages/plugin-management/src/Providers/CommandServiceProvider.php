<?php

namespace App\Packages\PluginManagement\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Packages\PluginManagement\Commands\ClearCompiledCommand;
use App\Packages\PluginManagement\Commands\IlluminateClearCompiledCommand as OverrideIlluminateClearCompiledCommand;
use App\Packages\PluginManagement\Commands\PackageDiscoverCommand;
use App\Packages\PluginManagement\Commands\PluginActivateAllCommand;
use App\Packages\PluginManagement\Commands\PluginActivateCommand;
use App\Packages\PluginManagement\Commands\PluginAssetsPublishCommand;
use App\Packages\PluginManagement\Commands\PluginDeactivateAllCommand;
use App\Packages\PluginManagement\Commands\PluginDeactivateCommand;
use App\Packages\PluginManagement\Commands\PluginDiscoverCommand;
use App\Packages\PluginManagement\Commands\PluginInstallFromMarketplaceCommand;
use App\Packages\PluginManagement\Commands\PluginListCommand;
use App\Packages\PluginManagement\Commands\PluginRemoveAllCommand;
use App\Packages\PluginManagement\Commands\PluginRemoveCommand;
use App\Packages\PluginManagement\Commands\PluginUpdateVersionInfoCommand;
use Illuminate\Foundation\Console\ClearCompiledCommand as IlluminateClearCompiledCommand;
use Illuminate\Foundation\Console\PackageDiscoverCommand as IlluminatePackageDiscoverCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->extend(IlluminatePackageDiscoverCommand::class, function () {
            return $this->app->make(PackageDiscoverCommand::class);
        });

        $this->app->extend(IlluminateClearCompiledCommand::class, function () {
            return $this->app->make(OverrideIlluminateClearCompiledCommand::class);
        });
    }

    public function boot(): void
    {
        if ($this->app->runningInConsole()) {
            $this->commands([
                PluginAssetsPublishCommand::class,
                ClearCompiledCommand::class,
                PluginDiscoverCommand::class,
                PluginInstallFromMarketplaceCommand::class,
                PluginActivateCommand::class,
                PluginActivateAllCommand::class,
                PluginDeactivateCommand::class,
                PluginDeactivateAllCommand::class,
                PluginRemoveCommand::class,
                PluginRemoveAllCommand::class,
                PluginListCommand::class,
                PluginUpdateVersionInfoCommand::class,
            ]);
        }
    }
}
