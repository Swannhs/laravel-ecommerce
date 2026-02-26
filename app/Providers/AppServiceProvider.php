<?php

namespace App\Providers;

use App\Packages\Sitemap\Sitemap;
use Illuminate\Contracts\Cache\Repository;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->singleton(Sitemap::class, function ($app) {
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
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
