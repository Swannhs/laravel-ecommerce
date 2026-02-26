<?php

namespace App\Plugins\AuditLog\Providers;

use App\Plugins\AuditLog\Models\AuditHistory;
use App\Plugins\AuditLog\Repositories\Eloquent\AuditLogRepository;
use App\Plugins\AuditLog\Repositories\Interfaces\AuditLogInterface;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\PanelSections\System\SystemPanelSection;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Contracts\Support\DeferrableProvider;
use Illuminate\Database\Console\PruneCommand;

class AuditLogServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(AuditLogInterface::class, function () {
            return new AuditLogRepository(new AuditHistory());
        });
    }

    public function boot(): void
    {
        $this->app->register(EventServiceProvider::class);

        if ($this->app->runningInConsole()) {
            $this->app->register(CommandServiceProvider::class);
        }

        $this
            ->setNamespace('plugins/audit-log')
            ->loadHelpers()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->publishAssets();

        PanelSectionManager::group('system')->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SystemPanelSection::class,
                fn () => PanelSectionItem::make('audit-logs')
                    ->setTitle(trans('plugins/audit-log::history.name'))
                    ->withDescription(trans('plugins/audit-log::history.description'))
                    ->withIcon('ti ti-note')
                    ->withPriority(10)
                    ->withRoute('audit-log.index')
            );
        });

        $this->app->booted(function (): void {
            $this->app->register(HookServiceProvider::class);
        });

        if ($this->app->runningInConsole()) {
            $this->app->afterResolving(Schedule::class, function (Schedule $schedule): void {
                $schedule
                    ->command(PruneCommand::class, ['--model' => AuditHistory::class])
                    ->dailyAt('00:30');
            });
        }
    }

    public function provides(): array
    {
        return [
            AuditLogInterface::class,
        ];
    }
}
