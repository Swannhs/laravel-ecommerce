<?php

namespace App\Plugins\SimpleSlider\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\Language\Facades\Language;
use App\Plugins\SimpleSlider\Models\SimpleSlider;
use App\Plugins\SimpleSlider\Models\SimpleSliderItem;
use App\Plugins\SimpleSlider\Repositories\Eloquent\SimpleSliderItemRepository;
use App\Plugins\SimpleSlider\Repositories\Eloquent\SimpleSliderRepository;
use App\Plugins\SimpleSlider\Repositories\Interfaces\SimpleSliderInterface;
use App\Plugins\SimpleSlider\Repositories\Interfaces\SimpleSliderItemInterface;
use Illuminate\Contracts\Support\DeferrableProvider;

class SimpleSliderServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(SimpleSliderInterface::class, function () {
            return new SimpleSliderRepository(new SimpleSlider());
        });

        $this->app->bind(SimpleSliderItemInterface::class, function () {
            return new SimpleSliderItemRepository(new SimpleSliderItem());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/simple-slider')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes(['web', 'api'])
            ->loadMigrations()
            ->publishAssets();

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-simple-slider')
                        ->priority(390)
                        ->name('plugins/simple-slider::simple-slider.menu')
                        ->icon('ti ti-slideshow')
                        ->route('simple-slider.index')
                );
        });

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            Language::registerModule(SimpleSlider::class);
        }

        $this->app->booted(function (): void {
            $this->app->register(HookServiceProvider::class);
        });
    }

    public function provides(): array
    {
        return [
            SimpleSliderInterface::class,
            SimpleSliderItemInterface::class,
        ];
    }
}
