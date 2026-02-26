<?php

namespace App\Core\Dashboard\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Core\Dashboard\Models\DashboardWidget;
use App\Core\Dashboard\Models\DashboardWidgetSetting;
use App\Core\Dashboard\Repositories\Eloquent\DashboardWidgetRepository;
use App\Core\Dashboard\Repositories\Eloquent\DashboardWidgetSettingRepository;
use App\Core\Dashboard\Repositories\Interfaces\DashboardWidgetInterface;
use App\Core\Dashboard\Repositories\Interfaces\DashboardWidgetSettingInterface;

/**
 * @since 02/07/2016 09:50 AM
 */
class DashboardServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(DashboardWidgetInterface::class, function () {
            return new DashboardWidgetRepository(new DashboardWidget());
        });

        $this->app->bind(DashboardWidgetSettingInterface::class, function () {
            return new DashboardWidgetSettingRepository(new DashboardWidgetSetting());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('core/dashboard')
            ->loadHelpers()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets()
            ->loadMigrations();

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-core-dashboard')
                        ->priority(-9999)
                        ->name('core/base::layouts.dashboard')
                        ->icon('ti ti-home')
                        ->route('dashboard.index')
                        ->permissions(false)
                );
        });
    }
}
