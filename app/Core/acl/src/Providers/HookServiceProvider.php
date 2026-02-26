<?php

namespace App\Core\ACL\Providers;

use App\Core\ACL\Hooks\UserWidgetHook;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Dashboard\Events\RenderingDashboardWidgets;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app['events']->listen(RenderingDashboardWidgets::class, function (): void {
            add_filter(DASHBOARD_FILTER_ADMIN_LIST, [UserWidgetHook::class, 'addUserStatsWidget'], 12, 2);
        });
    }
}
