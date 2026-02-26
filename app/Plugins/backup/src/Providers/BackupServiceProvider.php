<?php

namespace App\Plugins\Backup\Providers;

use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\PanelSections\System\SystemPanelSection;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Contracts\Support\DeferrableProvider;

class BackupServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this->setNamespace('plugins/backup')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        if ($this->app->runningInConsole()) {
            $this->app->register(CommandServiceProvider::class);
        }

        PanelSectionManager::group('system')->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SystemPanelSection::class,
                fn () => PanelSectionItem::make('backup')
                    ->setTitle(trans('plugins/backup::backup.name'))
                    ->withIcon('ti ti-database-share')
                    ->withDescription(trans('plugins/backup::backup.backup_description'))
                    ->withPriority(30)
                    ->withRoute('backups.index')
            );
        });

        $this->app->booted(function (): void {
            $this->app->register(HookServiceProvider::class);
        });
    }
}
