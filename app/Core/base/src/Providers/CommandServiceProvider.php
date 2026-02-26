<?php

namespace App\Core\Base\Providers;

use App\Core\Base\Commands\ActivateLicenseCommand;
use App\Core\Base\Commands\CacheWarmCommand;
use App\Core\Base\Commands\CleanupSystemCommand;
use App\Core\Base\Commands\ClearExpiredCacheCommand;
use App\Core\Base\Commands\ClearLogCommand;
use App\Core\Base\Commands\CompressImagesCommand;
use App\Core\Base\Commands\ExportDatabaseCommand;
use App\Core\Base\Commands\FetchGoogleFontsCommand;
use App\Core\Base\Commands\GoogleFontsUpdateCommand;
use App\Core\Base\Commands\ImportDatabaseCommand;
use App\Core\Base\Commands\InstallCommand;
use App\Core\Base\Commands\PublishAssetsCommand;
use App\Core\Base\Commands\UpdateCommand;
use App\Core\Base\Supports\ServiceProvider;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\AboutCommand;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            ActivateLicenseCommand::class,
            CacheWarmCommand::class,
            CleanupSystemCommand::class,
            ClearExpiredCacheCommand::class,
            ClearLogCommand::class,
            ExportDatabaseCommand::class,
            FetchGoogleFontsCommand::class,
            ImportDatabaseCommand::class,
            InstallCommand::class,
            PublishAssetsCommand::class,
            UpdateCommand::class,
            GoogleFontsUpdateCommand::class,
            CompressImagesCommand::class,
        ]);

        AboutCommand::add('Core Information', fn () => [
            'CMS Version' => get_cms_version(),
            'Core Version' => get_core_version(),
        ]);

        $this->app->afterResolving(Schedule::class, function (Schedule $schedule): void {
            $schedule->command(ClearExpiredCacheCommand::class)->everyFiveMinutes();
        });
    }
}
