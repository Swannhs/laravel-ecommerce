<?php

namespace App\Plugins\Ecommerce\Providers;

use App\Plugins\Ecommerce\Commands\CancelExpiredDeletionRequests;
use App\Plugins\Ecommerce\Commands\CheckAbandonedCartsCommand;
use App\Plugins\Ecommerce\Commands\SendAbandonedCartsEmailCommand;
use App\Plugins\Ecommerce\Models\SharedWishlist;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Support\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        if (! $this->app->runningInConsole()) {
            return;
        }

        $this->commands([
            SendAbandonedCartsEmailCommand::class,
            CancelExpiredDeletionRequests::class,
            CheckAbandonedCartsCommand::class,
        ]);

        $this->app->afterResolving(Schedule::class, function (Schedule $schedule): void {
            $schedule->command(SendAbandonedCartsEmailCommand::class)->weekly();
            $schedule->command(CancelExpiredDeletionRequests::class)->daily();

            $schedule->command(CheckAbandonedCartsCommand::class)
                ->hourly()
                ->when(fn () => get_ecommerce_setting('abandoned_cart_enabled', false));

            $schedule->command(CheckAbandonedCartsCommand::class, ['--cleanup' => true])
                ->daily()
                ->when(fn () => get_ecommerce_setting('abandoned_cart_enabled', false));

            $schedule->command('model:prune', [
                '--model' => [SharedWishlist::class],
            ])->daily();
        });
    }
}
