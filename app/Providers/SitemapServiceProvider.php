<?php

namespace App\Providers;

use App\Packages\Sitemap\Commands\IndexNowSubmissionCommand;
use App\Packages\Sitemap\Services\IndexNowService;
use App\Packages\Sitemap\Sitemap;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Core\Setting\PanelSections\SettingCommonPanelSection;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Contracts\Cache\Repository;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Foundation\Application;

class SitemapServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->singleton('sitemap', function (Application $app) {
            $config = $app['config']->get('packages.sitemap.config', []);

            return new Sitemap(
                $config,
                $app[Repository::class],
                $app['config'],
                $app['files'],
                $app[ResponseFactory::class],
                $app['view']
            );
        });

        $this->app->alias('sitemap', Sitemap::class);
        $this->app->singleton(IndexNowService::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('packages/sitemap')
            ->loadAndPublishConfigurations(['config'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->publishAssets();

        if ($this->app->runningInConsole()) {
            $this->commands([IndexNowSubmissionCommand::class]);

            $this->app->afterResolving(Schedule::class, function (Schedule $schedule): void {
                $schedule->command('sitemap:indexnow')->dailyAt('02:00');
            });
        }

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingCommonPanelSection::class,
                fn () => PanelSectionItem::make('sitemap')
                    ->setTitle(trans('packages/sitemap::sitemap.settings.title'))
                    ->withIcon('ti ti-sitemap')
                    ->withDescription(trans('packages/sitemap::sitemap.settings.description'))
                    ->withPriority(1000)
                    ->withRoute('sitemap.settings')
            );
        });
    }
}
