<?php

namespace App\Plugins\Backup\Providers;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Dashboard\Events\RenderingDashboardWidgets;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app['events']->listen(RenderingDashboardWidgets::class, function (): void {
            add_filter(DASHBOARD_FILTER_ADMIN_NOTIFICATIONS, [$this, 'registerAdminAlert'], 5);
        });
    }

    public function registerAdminAlert(?string $alert): string
    {
        if (! BaseHelper::hasDemoModeEnabled()) {
            return $alert;
        }

        return $alert . view('plugins/backup::partials.admin-alert')->render();
    }
}
