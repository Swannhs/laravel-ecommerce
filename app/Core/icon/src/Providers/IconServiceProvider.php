<?php

namespace App\Core\Icon\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Core\Icon\Commands\IconUpdateCommand;
use App\Core\Icon\Facades\Icon as IconFacade;
use App\Core\Icon\IconManager;
use App\Core\Icon\View\Components\Icon;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Support\Facades\Blade;

class IconServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this
            ->setNamespace('core/icon')
            ->loadAndPublishConfigurations('icon');

        $this->app->singleton(IconManager::class);
    }

    public function boot(): void
    {
        Blade::component('core::icon', Icon::class);

        $aliasLoader = AliasLoader::getInstance();

        if (! class_exists('CoreIcon')) {
            $aliasLoader->alias('CoreIcon', IconFacade::class);
        }

        if ($this->app->runningInConsole()) {
            $this->commands([IconUpdateCommand::class]);
        }
    }
}
