<?php

namespace App\Plugins\Newsletter\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Facades\EmailHandler;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\Newsletter\Contracts\Factory;
use App\Plugins\Newsletter\Forms\Fronts\NewsletterForm;
use App\Plugins\Newsletter\Http\Requests\NewsletterRequest;
use App\Plugins\Newsletter\Models\Newsletter;
use App\Plugins\Newsletter\NewsletterManager;
use App\Plugins\Newsletter\Repositories\Eloquent\NewsletterRepository;
use App\Plugins\Newsletter\Repositories\Interfaces\NewsletterInterface;
use App\Core\Setting\PanelSections\SettingOthersPanelSection;
use App\Packages\Theme\FormFrontManager;
use Illuminate\Contracts\Support\DeferrableProvider;

class NewsletterServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->singleton(NewsletterInterface::class, function () {
            return new NewsletterRepository(new Newsletter());
        });

        $this->app->singleton(Factory::class, function ($app) {
            return new NewsletterManager($app);
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/newsletter')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['email'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->publishAssets()
            ->loadAndPublishViews()
            ->loadMigrations();

        $this->app->register(EventServiceProvider::class);

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-newsletter')
                        ->priority(430)
                        ->name('plugins/newsletter::newsletter.name')
                        ->icon('ti ti-mail')
                        ->route('newsletter.index')
                );
        });

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('newsletter')
                    ->setTitle(trans('plugins/newsletter::newsletter.settings.title'))
                    ->withIcon('ti ti-mail-cog')
                    ->withDescription(trans('plugins/newsletter::newsletter.settings.panel_description'))
                    ->withPriority(140)
                    ->withRoute('newsletter.settings')
            );
        });

        $this->app->booted(function (): void {
            EmailHandler::addTemplateSettings(NEWSLETTER_MODULE_SCREEN_NAME, config('plugins.newsletter.email', []));
        });

        FormFrontManager::register(NewsletterForm::class, NewsletterRequest::class);

        add_filter(THEME_FRONT_FOOTER, function (?string $html): string {
            return $html . view('plugins/newsletter::partials.gtm-script')->render();
        }, 998);
    }

    public function provides(): array
    {
        return [Factory::class];
    }
}
