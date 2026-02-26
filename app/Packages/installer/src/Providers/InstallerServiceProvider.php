<?php

namespace App\Packages\Installer\Providers;

use App\Core\Base\Events\FinishedSeederEvent;
use App\Core\Base\Events\UpdatedEvent;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Packages\Installer\Http\Middleware\CheckIfInstalledMiddleware;
use App\Packages\Installer\Http\Middleware\CheckIfInstallingMiddleware;
use App\Packages\Installer\Http\Middleware\RedirectIfNotInstalledMiddleware;
use Carbon\Carbon;
use Illuminate\Routing\Events\RouteMatched;

class InstallerServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('packages/installer')
            ->loadHelpers()
            ->loadAndPublishConfigurations('installer')
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->loadRoutes()
            ->publishAssets();

        $this->app['events']->listen(RouteMatched::class, function (): void {
            if (defined('INSTALLED_SESSION_NAME')) {
                $router = $this->app->make('router');

                $router->middlewareGroup('install', [CheckIfInstalledMiddleware::class]);
                $router->middlewareGroup('installing', [CheckIfInstallingMiddleware::class]);

                $router->pushMiddlewareToGroup('web', RedirectIfNotInstalledMiddleware::class);
            }
        });

        $this->app['events']->listen([UpdatedEvent::class, FinishedSeederEvent::class], function (): void {
            BaseHelper::saveFileData(storage_path(INSTALLED_SESSION_NAME), Carbon::now()->toDateTimeString());
        });
    }
}
