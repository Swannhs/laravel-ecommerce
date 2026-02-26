<?php

namespace App\Plugins\Translation\Providers;

use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Packages\DataSynchronize\PanelSections\ExportPanelSection;
use App\Packages\DataSynchronize\PanelSections\ImportPanelSection;
use App\Plugins\Translation\Console\AutoTranslateCoreCommand;
use App\Plugins\Translation\Console\AutoTranslateThemeCommand;
use App\Plugins\Translation\Console\CheckMissingTranslationCommand;
use App\Plugins\Translation\Console\CleanupTranslationsCommand;
use App\Plugins\Translation\Console\DownloadLocaleCommand;
use App\Plugins\Translation\Console\FindTranslationsByPathCommand;
use App\Plugins\Translation\Console\RemoveLocaleCommand;
use App\Plugins\Translation\Console\RemoveUnusedTranslationsCommand;
use App\Plugins\Translation\Console\UpdateThemeTranslationCommand;
use App\Plugins\Translation\PanelSections\LocalizationPanelSection;

class TranslationServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/translation')
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        PanelSectionManager::beforeRendering(function (): void {
            PanelSectionManager::register(LocalizationPanelSection::class);
        });

        PanelSectionManager::setGroupId('data-synchronize')->beforeRendering(function (): void {
            PanelSectionManager::default()
                ->registerItem(
                    ExportPanelSection::class,
                    fn () => PanelSectionItem::make('export-theme-translations')
                        ->setTitle(trans('plugins/translation::translation.panel.theme-translations.title'))
                        ->withDescription(trans(
                            'plugins/translation::translation.export_description',
                            ['name' => trans('plugins/translation::translation.panel.theme-translations.title')]
                        ))
                        ->withPriority(999)
                        ->withPermission('theme-translations.export')
                        ->withRoute('tools.data-synchronize.export.theme-translations.index')
                )
                ->registerItem(
                    ExportPanelSection::class,
                    fn () => PanelSectionItem::make('other-translations')
                        ->setTitle(trans('plugins/translation::translation.panel.admin-translations.title'))
                        ->withDescription(trans(
                            'plugins/translation::translation.export_description',
                            ['name' => trans('plugins/translation::translation.panel.admin-translations.title')]
                        ))
                        ->withPriority(999)
                        ->withPermission('other-translations.export')
                        ->withRoute('tools.data-synchronize.export.other-translations.index')
                )
                ->registerItem(
                    ImportPanelSection::class,
                    fn () => PanelSectionItem::make('import-theme-translations')
                        ->setTitle(trans('plugins/translation::translation.panel.theme-translations.title'))
                        ->withDescription(trans(
                            'plugins/translation::translation.import_description',
                            ['name' => trans('plugins/translation::translation.panel.theme-translations.title')]
                        ))
                        ->withPriority(999)
                        ->withPermission('theme-translations.import')
                        ->withRoute('tools.data-synchronize.import.theme-translations.index')
                )
                ->registerItem(
                    ImportPanelSection::class,
                    fn () => PanelSectionItem::make('other-translations')
                        ->setTitle(trans('plugins/translation::translation.panel.admin-translations.title'))
                        ->withDescription(trans(
                            'plugins/translation::translation.import_description',
                            ['name' => trans('plugins/translation::translation.panel.admin-translations.title')]
                        ))
                        ->withPriority(999)
                        ->withPermission('other-translations.import')
                        ->withRoute('tools.data-synchronize.import.other-translations.index')
                );
        });

        if ($this->app->runningInConsole()) {
            $this->commands([
                UpdateThemeTranslationCommand::class,
                FindTranslationsByPathCommand::class,
                CleanupTranslationsCommand::class,
                RemoveUnusedTranslationsCommand::class,
                DownloadLocaleCommand::class,
                RemoveLocaleCommand::class,
                AutoTranslateThemeCommand::class,
                AutoTranslateCoreCommand::class,
                CheckMissingTranslationCommand::class,
            ]);
        }
    }
}
