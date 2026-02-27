<?php

namespace App\Packages\Widget\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Packages\Theme\Events\RenderingAdminBar;
use App\Packages\Theme\Facades\AdminBar;
use App\Packages\Widget\Events\RenderingWidgetSettings;
use App\Packages\Widget\Facades\WidgetGroup;
use App\Packages\Widget\Factories\WidgetFactory;
use App\Packages\Widget\Models\Widget;
use App\Packages\Widget\Repositories\Eloquent\WidgetRepository;
use App\Packages\Widget\Repositories\Interfaces\WidgetInterface;
use App\Packages\Widget\WidgetGroupCollection;
use App\Packages\Widget\Widgets\CoreSimpleMenu;
use App\Packages\Widget\Widgets\Text;
use Illuminate\Contracts\Foundation\Application;

class WidgetServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(WidgetInterface::class, function () {
            return new WidgetRepository(new Widget());
        });

        $this->app->bind('platformcore.widget', function (Application $app) {
            return new WidgetFactory($app);
        });

        $this->app->singleton('platformcore.widget-group-collection', function (Application $app) {
            return new WidgetGroupCollection($app);
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('packages/widget')
            ->loadAndPublishConfigurations(['permissions'])
            ->loadHelpers()
            ->loadRoutes()
            ->loadMigrations()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        $this->app->booted(function (): void {
            $this->app['events']->listen([RenderingWidgetSettings::class, 'core.widget:rendering'], function (): void {
                WidgetGroup::setGroup([
                    'id' => 'primary_sidebar',
                    'name' => trans('packages/widget::widget.primary_sidebar_name'),
                    'description' => trans('packages/widget::widget.primary_sidebar_description'),
                ]);

                register_widget(CoreSimpleMenu::class);
                register_widget(Text::class);
            });

            DashboardMenu::default()->beforeRetrieving(function (): void {
                DashboardMenu::make()
                    ->registerItem(
                        DashboardMenuItem::make()
                            ->id('cms-core-widget')
                            ->parentId('cms-core-appearance')
                            ->priority(3)
                            ->name('packages/widget::widget.name')
                            ->icon('ti ti-layout')
                            ->route('widgets.index')
                            ->permissions('widgets.index')
                    );
            });

            $this->app['events']->listen(RenderingAdminBar::class, function (): void {
                AdminBar::registerLink(
                    trans('packages/widget::widget.name'),
                    route('widgets.index'),
                    'appearance',
                    'widgets.index'
                );
            });
        });

        $this->app->register(HookServiceProvider::class);
    }
}
