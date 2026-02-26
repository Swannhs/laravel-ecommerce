<?php

namespace App\Plugins\Testimonial\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\LanguageAdvanced\Supports\LanguageAdvancedManager;
use App\Plugins\Testimonial\Models\Testimonial;
use App\Plugins\Testimonial\Repositories\Eloquent\TestimonialRepository;
use App\Plugins\Testimonial\Repositories\Interfaces\TestimonialInterface;

class TestimonialServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(TestimonialInterface::class, function () {
            return new TestimonialRepository(new Testimonial());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/testimonial')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadRoutes();

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Testimonial::class, [
                'name',
                'content',
                'company',
            ]);
        }

        DashboardMenu::beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-testimonial',
                    'priority' => 5,
                    'name' => 'plugins/testimonial::testimonial.name',
                    'icon' => 'ti ti-user-star',
                    'url' => route('testimonial.index'),
                    'permissions' => ['testimonial.index'],
            ]);
        });
    }
}
