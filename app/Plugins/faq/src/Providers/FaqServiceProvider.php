<?php

namespace App\Plugins\Faq\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\Faq\Contracts\Faq as FaqContract;
use App\Plugins\Faq\FaqSupport;
use App\Plugins\Faq\Models\Faq;
use App\Plugins\Faq\Models\FaqCategory;
use App\Plugins\Faq\Repositories\Eloquent\FaqCategoryRepository;
use App\Plugins\Faq\Repositories\Eloquent\FaqRepository;
use App\Plugins\Faq\Repositories\Interfaces\FaqCategoryInterface;
use App\Plugins\Faq\Repositories\Interfaces\FaqInterface;
use App\Plugins\LanguageAdvanced\Supports\LanguageAdvancedManager;
use App\Core\Setting\PanelSections\SettingOthersPanelSection;
use Illuminate\Contracts\Support\DeferrableProvider;

class FaqServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(FaqCategoryInterface::class, function () {
            return new FaqCategoryRepository(new FaqCategory());
        });

        $this->app->bind(FaqInterface::class, function () {
            return new FaqRepository(new Faq());
        });

        $this->app->singleton(FaqContract::class, FaqSupport::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/faq')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->publishAssets();

        if (defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Faq::class, [
                'question',
                'answer',
            ]);

            LanguageAdvancedManager::registerModule(FaqCategory::class, [
                'name',
            ]);

            LanguageAdvancedManager::addTranslatableMetaBox('faq_schema_config_wrapper');

            foreach (config('plugins.faq.general.schema_supported', []) as $item) {
                $translatableColumns = array_merge(LanguageAdvancedManager::getTranslatableColumns($item), ['faq_schema_config', 'faq_ids']);

                LanguageAdvancedManager::registerModule($item, $translatableColumns);
            }
        }

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-faq')
                        ->priority(420)
                        ->name('plugins/faq::faq.name')
                        ->icon('ti ti-help-octagon')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-faq-list')
                        ->priority(0)
                        ->parentId('cms-plugins-faq')
                        ->name('plugins/faq::faq.name')
                        ->icon('ti ti-list-check')
                        ->route('faq.index')
                )
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-plugins-faq-category')
                        ->priority(10)
                        ->parentId('cms-plugins-faq')
                        ->name('plugins/faq::faq-category.name')
                        ->icon('ti ti-folder')
                        ->route('faq_category.index')
                );
        });

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('faqs')
                    ->setTitle(trans('plugins/faq::faq.settings.title'))
                    ->withIcon('ti ti-settings-question')
                    ->withPriority(420)
                    ->withDescription(trans('plugins/faq::faq.settings.description'))
                    ->withRoute('faqs.settings')
            );
        });

        $this->app->register(HookServiceProvider::class);
        $this->app->register(EventServiceProvider::class);
    }

    public function provides(): array
    {
        return [
            FaqCategoryInterface::class,
            FaqInterface::class,
            FaqContract::class,
        ];
    }
}
