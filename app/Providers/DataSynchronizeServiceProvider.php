<?php

namespace App\Providers;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Facades\PanelSectionManager as PanelSectionManagerFacade;
use App\Packages\DataSynchronize\Commands\ClearChunksCommand;
use App\Packages\DataSynchronize\Commands\ExportCommand;
use App\Packages\DataSynchronize\Commands\ExportControllerMakeCommand;
use App\Packages\DataSynchronize\Commands\ExporterMakeCommand;
use App\Packages\DataSynchronize\Commands\ImportCommand;
use App\Packages\DataSynchronize\Commands\ImportControllerMakeCommand;
use App\Packages\DataSynchronize\Commands\ImporterMakeCommand;
use App\Packages\DataSynchronize\Commands\TestLargeExportCommand;
use App\Packages\DataSynchronize\PanelSections\ExportPanelSection;
use App\Packages\DataSynchronize\PanelSections\ImportPanelSection;
use Illuminate\Support\ServiceProvider;

class DataSynchronizeServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        $this->mergeConfigFrom(
            app_path('Packages/data-synchronize/config/data-synchronize.php'),
            'packages.data-synchronize.data-synchronize'
        );
    }

    public function boot(): void
    {
        $this->loadTranslationsFrom(
            app_path('Packages/data-synchronize/resources/lang'),
            'packages/data-synchronize'
        );
        $this->loadViewsFrom(
            app_path('Packages/data-synchronize/resources/views'),
            'packages/data-synchronize'
        );

        if ($this->app->runningInConsole()) {
            $this->commands([
                ImporterMakeCommand::class,
                ExporterMakeCommand::class,
                ImportControllerMakeCommand::class,
                ExportControllerMakeCommand::class,
                ClearChunksCommand::class,
                ExportCommand::class,
                ImportCommand::class,
                TestLargeExportCommand::class,
            ]);

            $this->publishes([
                app_path('Packages/data-synchronize/public') => public_path('vendor/core/packages/data-synchronize'),
            ], 'cms-public');
            $this->publishes([
                app_path('Packages/data-synchronize/resources/views') => resource_path('views/vendor/packages/data-synchronize'),
            ], 'cms-views');
            $this->publishes([
                app_path('Packages/data-synchronize/resources/lang') => lang_path('vendor/packages/data-synchronize'),
            ], 'cms-lang');
            $this->publishes([
                app_path('Packages/data-synchronize/config/data-synchronize.php') => config_path('packages/data-synchronize/data-synchronize.php'),
            ], 'cms-config');
        }

        $this->registerPanelSection();
        $this->registerDashboardMenu();
    }

    protected function registerPanelSection(): void
    {
        PanelSectionManagerFacade::group('data-synchronize')->beforeRendering(function (): void {
            PanelSectionManagerFacade::default()
                ->register(ExportPanelSection::class)
                ->register(ImportPanelSection::class);
        });
    }

    protected function registerDashboardMenu(): void
    {
        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-packages-data-synchronize',
                    'parent_id' => 'cms-core-tools',
                    'priority' => 9000,
                    'name' => 'packages/data-synchronize::data-synchronize.tools.export_import_data',
                    'icon' => 'ti ti-package-import',
                    'route' => 'tools.data-synchronize',
                ]);
        });
    }
}
