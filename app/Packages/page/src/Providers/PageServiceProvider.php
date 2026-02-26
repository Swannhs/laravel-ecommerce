<?php

namespace App\Packages\Page\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Packages\Page\Models\Page;
use App\Packages\Page\Repositories\Eloquent\PageRepository;
use App\Packages\Page\Repositories\Interfaces\PageInterface;
use App\Packages\Shortcode\View\View;
use App\Packages\Theme\Events\RenderingAdminBar;
use App\Packages\Theme\Facades\AdminBar;
use Illuminate\Support\Facades\View as ViewFacade;

/**
 * @since 02/07/2016 09:50 AM
 */
class PageServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this->app->bind(PageInterface::class, function () {
            return new PageRepository(new Page());
        });

        $this
            ->setNamespace('packages/page')
            ->loadAndPublishConfigurations(['permissions'])
            ->loadHelpers()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->publishAssets()
            ->loadMigrations();

        if (class_exists('ApiHelper')) {
            $this->loadRoutes(['api']);
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

        $this->app['events']->listen(RenderingAdminBar::class, function (): void {
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

        $this->app->booted(function (): void {
            $this->app->register(HookServiceProvider::class);
        });

        $this->app->register(EventServiceProvider::class);
    }
}
