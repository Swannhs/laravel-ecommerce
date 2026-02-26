<?php

namespace App\Packages\Api\Providers;

use App\Packages\Api\Commands\GenerateDocumentationCommand;
use App\Packages\Api\Commands\ProcessScheduledNotificationsCommand;
use App\Packages\Api\Commands\SendPushNotificationCommand;
use App\Packages\Api\Facades\ApiHelper;
use App\Packages\Api\Models\PersonalAccessToken;
use App\Core\Base\Events\SystemUpdateDBMigrated;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Core\Setting\PanelSections\SettingCommonPanelSection;
use Illuminate\Foundation\AliasLoader;
use Laravel\Sanctum\Sanctum;

class ApiServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app['config']->set([
            'scribe.routes.0.match.prefixes' => ['api/*'],
            'scribe.routes.0.apply.headers' => [
                'Authorization' => 'Bearer {token}',
                'Api-Version' => 'v1',
            ],
        ]);

        if (class_exists('ApiHelper')) {
            AliasLoader::getInstance()->alias('ApiHelper', ApiHelper::class);
        }
    }

    public function boot(): void
    {
        if (version_compare('7.2.0', get_core_version(), '>')) {
            return;
        }

        $this
            ->setNamespace('packages/api')
            ->loadRoutes()
            ->loadAndPublishConfigurations(['api', 'permissions'])
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->loadAndPublishViews()
            ->publishAssets();

        Sanctum::usePersonalAccessTokenModel(PersonalAccessToken::class);

        PanelSectionManager::beforeRendering(function () {
            PanelSectionManager::default()
                ->registerItem(
                    SettingCommonPanelSection::class,
                    fn () => PanelSectionItem::make('settings.common.api')
                        ->setTitle(trans('packages/api::api.settings'))
                        ->withDescription(trans('packages/api::api.settings_description'))
                        ->withIcon('ti ti-api')
                        ->withPriority(110)
                        ->withRoute('api.settings')
                );
        });

        if ($this->app->runningInConsole()) {
            $this->commands([
                GenerateDocumentationCommand::class,
                ProcessScheduledNotificationsCommand::class,
                SendPushNotificationCommand::class,
            ]);
        }

        $this->app->booted(function () {
            add_filter('core_acl_role_permissions', function (array $permissions) {
                $apiPermissions = $this->app['config']->get('packages.api.permissions', []);

                if (! $apiPermissions) {
                    return $permissions;
                }

                foreach ($apiPermissions as $permission) {
                    $permissions[$permission['flag']] = $permission;
                }

                return $permissions;
            }, 120);
        });

        $this->app['events']->listen(SystemUpdateDBMigrated::class, function () {
            $this->app['migrator']->run($this->getPath('database/migrations'));
        });
    }

    protected function getPath(?string $path = null): string
    {
        return __DIR__ . '/../..' . ($path ? '/' . ltrim($path, '/') : '');
    }
}
