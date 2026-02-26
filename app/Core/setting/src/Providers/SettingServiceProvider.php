<?php

namespace App\Core\Setting\Providers;

use App\Core\Base\Events\PanelSectionsRendering;
use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Facades\EmailHandler;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\PanelSections\System\SystemPanelSection;
use App\Core\Base\Supports\DashboardMenuItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Core\Setting\Commands\CronJobTestCommand;
use App\Core\Setting\Facades\Setting;
use App\Core\Setting\Listeners\PushDashboardMenuToOtherSectionPanel;
use App\Core\Setting\Models\Setting as SettingModel;
use App\Core\Setting\PanelSections\SettingCommonPanelSection;
use App\Core\Setting\PanelSections\SettingOthersPanelSection;
use App\Core\Setting\Repositories\Eloquent\SettingRepository;
use App\Core\Setting\Repositories\Interfaces\SettingInterface;
use App\Core\Setting\Supports\DatabaseSettingStore;
use App\Core\Setting\Supports\SettingStore;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Contracts\Support\DeferrableProvider;
use Illuminate\Foundation\AliasLoader;

class SettingServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this
            ->setNamespace('core/setting')
            ->loadAndPublishConfigurations(['general']);

        $this->app->singleton(SettingStore::class, function () {
            return new DatabaseSettingStore();
        });

        $this->app->bind(SettingInterface::class, function () {
            return new SettingRepository(new SettingModel());
        });

        if (! class_exists('Setting')) {
            AliasLoader::getInstance()->alias('Setting', Setting::class);
        }

        $this->loadHelpers();
    }

    public function boot(): void
    {
        $this
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAnonymousComponents()
            ->loadAndPublishTranslations()
            ->loadAndPublishConfigurations(['email'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadMigrations()
            ->publishAssets();

        DashboardMenu::default()->beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem(
                    DashboardMenuItem::make()
                        ->id('cms-core-settings')
                        ->priority(9999)
                        ->name('core/setting::setting.title')
                        ->icon('ti ti-settings')
                        ->route('settings.index')
                        ->permission('settings.index')
                );
        });

        $events = $this->app['events'];

        $this->app->booted(function (): void {
            EmailHandler::addTemplateSettings('base', config('core.setting.email', []), 'core');
        });

        PanelSectionManager::default()
            ->beforeRendering(function (): void {
                PanelSectionManager::setGroupName(trans('core/setting::setting.title'))
                    ->register([
                        SettingCommonPanelSection::class,
                        SettingOthersPanelSection::class,
                    ]);
            });

        PanelSectionManager::group('system')->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SystemPanelSection::class,
                fn () => PanelSectionItem::make('cronjob')
                    ->setTitle(trans('core/setting::cronjob.name'))
                    ->withIcon('ti ti-calendar-event')
                    ->withDescription(trans('core/setting::cronjob.description'))
                    ->withPriority(50)
                    ->withRoute('system.cronjob')
            );

            PanelSectionManager::registerItem(
                SystemPanelSection::class,
                fn () => PanelSectionItem::make('security')
                    ->setTitle(trans('core/setting::setting.security.title'))
                    ->withIcon('ti ti-shield-check')
                    ->withDescription(trans('core/setting::setting.security.menu_description'))
                    ->withPriority(55)
                    ->withRoute('system.security')
            );
        });

        $events->listen(PanelSectionsRendering::class, PushDashboardMenuToOtherSectionPanel::class);

        if ($this->app->runningInConsole()) {
            $this->commands([
                CronJobTestCommand::class,
            ]);

            $this->app->afterResolving(Schedule::class, function (Schedule $schedule): void {
                rescue(function () use ($schedule): void {
                    $schedule
                        ->command(CronJobTestCommand::class)
                        ->everyMinute();
                });
            });
        }
    }

    public function provides(): array
    {
        return [
            SettingStore::class,
        ];
    }
}
