<?php

namespace App\Providers;

use App\Packages\Sitemap\Sitemap;
use Illuminate\Contracts\Cache\Repository;
use Illuminate\Contracts\Routing\ResponseFactory;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;

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
        $this->registerLegacyPlatformCoreModelAliases();
    }

    /**
     * Backward compatibility for legacy polymorphic model types stored in old DB rows.
     * Example: PlatformCore\Page\Models\Page -> App\Packages\Page\Models\Page
     */
    protected function registerLegacyPlatformCoreModelAliases(): void
    {
        $mappings = [
            'Core' => glob(app_path('Core/*/src/Models/*.php')) ?: [],
            'Packages' => glob(app_path('Packages/*/src/Models/*.php')) ?: [],
            'Plugins' => glob(app_path('Plugins/*/src/Models/*.php')) ?: [],
        ];

        foreach ($mappings as $segment => $files) {
            foreach ($files as $file) {
                $model = pathinfo($file, PATHINFO_FILENAME);
                $module = basename(dirname(dirname(dirname($file))));

                $newNamespace = sprintf('App\\%s\\%s\\Models\\%s', $segment, Str::studly($module), $model);
                $oldNamespace = sprintf('PlatformCore\\%s\\Models\\%s', Str::studly($module), $model);

                if (class_exists($newNamespace) && ! class_exists($oldNamespace)) {
                    class_alias($newNamespace, $oldNamespace);
                }

                // Legacy ACL namespace can appear as uppercase acronym.
                if (strtolower($module) === 'acl') {
                    $oldAclNamespace = sprintf('PlatformCore\\ACL\\Models\\%s', $model);

                    if (class_exists($newNamespace) && ! class_exists($oldAclNamespace)) {
                        class_alias($newNamespace, $oldAclNamespace);
                    }
                }
            }
        }
    }
}
