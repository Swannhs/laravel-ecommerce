<?php

namespace App\Providers;

use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Packages\Menu\Commands\ClearMenuCacheCommand;
use App\Packages\Menu\Facades\Menu;
use App\Packages\Menu\Listeners\DeleteMenuNodeListener;
use App\Packages\Menu\Listeners\UpdateMenuNodeUrlListener;
use App\Packages\Menu\Models\Menu as MenuModel;
use App\Packages\Menu\Models\MenuLocation;
use App\Packages\Menu\Models\MenuNode;
use App\Packages\Menu\Repositories\Eloquent\MenuLocationRepository;
use App\Packages\Menu\Repositories\Eloquent\MenuNodeRepository;
use App\Packages\Menu\Repositories\Eloquent\MenuRepository;
use App\Packages\Menu\Repositories\Interfaces\MenuInterface;
use App\Packages\Menu\Repositories\Interfaces\MenuLocationInterface;
use App\Packages\Menu\Repositories\Interfaces\MenuNodeInterface;
use App\Packages\Slug\Events\UpdatedSlugEvent;
use App\Packages\Theme\Events\RenderingAdminBar;
use App\Packages\Theme\Facades\AdminBar;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\ServiceProvider;

class MenuServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind(MenuInterface::class, fn () => new MenuRepository(new MenuModel()));
        $this->app->bind(MenuNodeInterface::class, fn () => new MenuNodeRepository(new MenuNode()));
        $this->app->bind(MenuLocationInterface::class, fn () => new MenuLocationRepository(new MenuLocation()));

        $this->mergeConfigFrom(
            app_path('Packages/menu/config/permissions.php'),
            'packages.menu.permissions'
        );
    }

    public function boot(): void
    {
        $helperFile = app_path('Packages/menu/helpers/constants.php');
        if (is_file($helperFile)) {
            require_once $helperFile;
        }

        $this->loadViewsFrom(app_path('Packages/menu/resources/views'), 'packages/menu');
        $this->loadTranslationsFrom(app_path('Packages/menu/resources/lang'), 'packages/menu');
        $this->loadMigrationsFrom(app_path('Packages/menu/database/migrations'));

        if ($this->app->runningInConsole()) {
            $this->commands([ClearMenuCacheCommand::class]);

            $this->publishes([
                app_path('Packages/menu/public') => public_path('vendor/core/packages/menu'),
            ], 'cms-public');
            $this->publishes([
                app_path('Packages/menu/resources/views') => resource_path('views/vendor/packages/menu'),
            ], 'cms-views');
            $this->publishes([
                app_path('Packages/menu/resources/lang') => lang_path('vendor/packages/menu'),
            ], 'cms-lang');
            $this->publishes([
                app_path('Packages/menu/config/permissions.php') => config_path('packages/menu/permissions.php'),
            ], 'cms-config');
        }

        $this->registerDashboardMenu();
        $this->registerEventListeners();
    }

    protected function registerDashboardMenu(): void
    {
        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()->registerItem(
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
    }

    protected function registerEventListeners(): void
    {
        Event::listen(RenderingAdminBar::class, function (): void {
            AdminBar::registerLink(
                trans('packages/menu::menu.name'),
                route('menus.index'),
                'appearance',
                'menus.index'
            );
        });

        Event::listen('cms.menu::registering-locations', function (): void {
            Menu::addMenuLocation('main-menu', trans('packages/menu::menu.main_navigation'));
        });

        Event::listen(UpdatedSlugEvent::class, [UpdateMenuNodeUrlListener::class, 'handle']);
        Event::listen(DeletedContentEvent::class, [DeleteMenuNodeListener::class, 'handle']);
    }
}
