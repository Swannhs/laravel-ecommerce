<?php

namespace App\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Packages\Page\Models\Page;
use App\Packages\Page\Providers\EventServiceProvider as PageEventServiceProvider;
use App\Packages\Page\Providers\HookServiceProvider as PageHookServiceProvider;
use App\Packages\Page\Repositories\Eloquent\PageRepository;
use App\Packages\Page\Repositories\Interfaces\PageInterface;
use App\Packages\Shortcode\View\View;
use App\Packages\Theme\Events\RenderingAdminBar;
use App\Packages\Theme\Facades\AdminBar;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\View as ViewFacade;
use Illuminate\Support\ServiceProvider;

class PageServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->app->bind(PageInterface::class, fn () => new PageRepository(new Page()));

        $this->mergeConfigFrom(
            app_path('Packages/page/config/permissions.php'),
            'packages.page.permissions'
        );
    }

    public function boot(): void
    {
        foreach ([
            app_path('Packages/page/helpers/constants.php'),
            app_path('Packages/page/helpers/helpers.php'),
        ] as $helperFile) {
            if (is_file($helperFile)) {
                require_once $helperFile;
            }
        }

        $this->loadViewsFrom(app_path('Packages/page/resources/views'), 'packages/page');
        $this->loadTranslationsFrom(app_path('Packages/page/resources/lang'), 'packages/page');
        $this->loadMigrationsFrom(app_path('Packages/page/database/migrations'));

        if ($this->app->runningInConsole()) {
            $this->publishes([
                app_path('Packages/page/public') => public_path('vendor/core/packages/page'),
            ], 'cms-public');
            $this->publishes([
                app_path('Packages/page/resources/views') => resource_path('views/vendor/packages/page'),
            ], 'cms-views');
            $this->publishes([
                app_path('Packages/page/resources/lang') => lang_path('vendor/packages/page'),
            ], 'cms-lang');
            $this->publishes([
                app_path('Packages/page/config/permissions.php') => config_path('packages/page/permissions.php'),
            ], 'cms-config');
        }

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-core-page')
                        ->priority(2)
                        ->name('packages/page::pages.menu_name')
                        ->icon('ti ti-notebook')
                        ->route('pages.index')
                        ->permissions('pages.index')
                );
        });

        Event::listen(RenderingAdminBar::class, function (): void {
            AdminBar::registerLink(
                trans('packages/page::pages.menu_name'),
                route('pages.create'),
                'add-new',
                'pages.create'
            );
        });

        if (function_exists('shortcode')) {
            ViewFacade::composer(['packages/page::themes.page'], function (View $view): void {
                $view->withShortcodes();
            });
        }

        $this->app->register(PageEventServiceProvider::class);

        $this->app->booted(function (): void {
            $this->app->register(PageHookServiceProvider::class);
        });
    }
}
