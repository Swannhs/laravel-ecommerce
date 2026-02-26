<?php

namespace App\Packages\SeoHelper\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Packages\SeoHelper\Contracts\SeoHelperContract;
use App\Packages\SeoHelper\Contracts\SeoMetaContract;
use App\Packages\SeoHelper\Contracts\SeoOpenGraphContract;
use App\Packages\SeoHelper\Contracts\SeoTwitterContract;
use App\Packages\SeoHelper\SeoHelper;
use App\Packages\SeoHelper\SeoMeta;
use App\Packages\SeoHelper\SeoOpenGraph;
use App\Packages\SeoHelper\SeoTwitter;

/**
 * @since 02/12/2015 14:09 PM
 */
class SeoHelperServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(SeoMetaContract::class, SeoMeta::class);
        $this->app->bind(SeoHelperContract::class, SeoHelper::class);
        $this->app->bind(SeoOpenGraphContract::class, SeoOpenGraph::class);
        $this->app->bind(SeoTwitterContract::class, SeoTwitter::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('packages/seo-helper')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        $this->app->register(EventServiceProvider::class);
        $this->app->register(HookServiceProvider::class);
    }
}
