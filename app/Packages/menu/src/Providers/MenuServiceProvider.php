<?php

namespace App\Packages\Menu\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Packages\Menu\Facades\Menu;
use App\Packages\Menu\Models\Menu as MenuModel;
use App\Packages\Menu\Models\MenuLocation;
use App\Packages\Menu\Models\MenuNode;
use App\Packages\Menu\Repositories\Eloquent\MenuLocationRepository;
use App\Packages\Menu\Repositories\Eloquent\MenuNodeRepository;
use App\Packages\Menu\Repositories\Eloquent\MenuRepository;
use App\Packages\Menu\Repositories\Interfaces\MenuInterface;
use App\Packages\Menu\Repositories\Interfaces\MenuLocationInterface;
use App\Packages\Menu\Repositories\Interfaces\MenuNodeInterface;
use App\Packages\Theme\Events\RenderingAdminBar;
use App\Packages\Theme\Facades\AdminBar;

class MenuServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(MenuInterface::class, function () {
            return new MenuRepository(new MenuModel());
        });

        $this->app->bind(MenuNodeInterface::class, function () {
            return new MenuNodeRepository(new MenuNode());
        });

        $this->app->bind(MenuLocationInterface::class, function () {
            return new MenuLocationRepository(new MenuLocation());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('packages/menu')
            ->loadAndPublishConfigurations(['permissions'])
            ->loadHelpers()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->publishAssets();

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-core-menu')
                        ->parentId('cms-core-appearance')
                        ->priority(2)
                        ->name('packages/menu::menu.name')
                        ->icon('ti ti-tournament')
                        ->route('menus.index')
                        ->permissions('menus.index')
                );
        });

        $this->app['events']->listen(RenderingAdminBar::class, function (): void {
            AdminBar::registerLink(
                trans('packages/menu::menu.name'),
                route('menus.index'),
                'appearance',
                'menus.index'
            );
        });

        $this->app['events']->listen('cms.menu::registering-locations', function (): void {
            Menu::addMenuLocation('main-menu', trans('packages/menu::menu.main_navigation'));
        });

        $this->app->register(EventServiceProvider::class);
        $this->app->register(CommandServiceProvider::class);
    }
}
