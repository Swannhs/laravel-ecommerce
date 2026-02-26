<?php

namespace App\Plugins\Language\Providers;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\Language\Facades\Language;
use App\Plugins\Language\Http\Middleware\ApiLanguageMiddleware;
use App\Plugins\Language\Http\Middleware\LocaleSessionRedirect;
use App\Plugins\Language\Http\Middleware\LocalizationRedirectFilter;
use App\Plugins\Language\Http\Middleware\LocalizationRoutes;
use App\Plugins\Language\Models\Language as LanguageModel;
use App\Plugins\Language\Models\LanguageMeta;
use App\Plugins\Language\Repositories\Eloquent\LanguageMetaRepository;
use App\Plugins\Language\Repositories\Eloquent\LanguageRepository;
use App\Plugins\Language\Repositories\Interfaces\LanguageInterface;
use App\Plugins\Language\Repositories\Interfaces\LanguageMetaInterface;
use App\Core\Setting\PanelSections\SettingCommonPanelSection;
use App\Packages\Theme\Facades\Theme;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Arr;

class LanguageServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(LanguageInterface::class, function () {
            return new LanguageRepository(new LanguageModel());
        });

        $this->app->bind(LanguageMetaInterface::class, function () {
            return new LanguageMetaRepository(new LanguageMeta());
        });

        AliasLoader::getInstance()->alias('Language', Language::class);

        $router = $this->app['router'];
        $router->aliasMiddleware('localize', LocalizationRoutes::class);
        $router->aliasMiddleware('localizationRedirect', LocalizationRedirectFilter::class);
        $router->aliasMiddleware('localeSessionRedirect', LocaleSessionRedirect::class);
        $router->aliasMiddleware('api.language', ApiLanguageMiddleware::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/language')
            ->loadAndPublishConfigurations(['general'])
            ->setNamespace('plugins/language')
            ->loadHelpers()
            ->loadAndPublishConfigurations(['permissions'])
            ->loadRoutes(['web', 'api'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadMigrations()
            ->publishAssets();

        $this->app->register(CommandServiceProvider::class);
        $this->app->register(EventServiceProvider::class);

        if (is_plugin_active('language')) {
            add_filter(BASE_FILTER_GROUP_PUBLIC_ROUTE, [$this, 'addLanguageMiddlewareToPublicRoute'], 958);
        }

        if (! $this->app->runningInConsole() && is_plugin_active('language')) {
            PanelSectionManager::default()->beforeRendering(function (): void {
                PanelSectionManager::registerItem(
                    SettingCommonPanelSection::class,
                    fn () => PanelSectionItem::make('language')
                        ->setTitle(trans('plugins/language::language.name'))
                        ->withIcon('ti ti-language')
                        ->withDescription(trans('plugins/language::language.description'))
                        ->withPriority(100)
                        ->withRoute('languages.index')
                );
            });

            $this->app['events']->listen(RouteMatched::class, function (): void {
                Assets::addScriptsDirectly('vendor/core/plugins/language/js/language-global.js')
                    ->addStylesDirectly(['vendor/core/plugins/language/css/language.css']);
            });

            $this->app->booted(function (): void {
                if (defined('THEME_OPTIONS_MODULE_SCREEN_NAME')) {
                    Language::registerModule(THEME_OPTIONS_MODULE_SCREEN_NAME);
                }

                if (defined('WIDGET_MANAGER_MODULE_SCREEN_NAME')) {
                    Language::registerModule(WIDGET_MANAGER_MODULE_SCREEN_NAME);
                }

                if (defined('THEME_OPTIONS_MODULE_SCREEN_NAME') && ! $this->app->isDownForMaintenance()) {
                    Theme::asset()
                        ->usePath(false)
                        ->add(
                            'language-css',
                            asset('vendor/core/plugins/language/css/language-public.css'),
                            [],
                            [],
                            '2.2.0'
                        );

                    Theme::asset()
                        ->container('footer')
                        ->usePath(false)
                        ->add(
                            'language-public-js',
                            asset('vendor/core/plugins/language/js/language-public.js'),
                            ['jquery'],
                            [],
                            '2.2.0'
                        );
                }

                Language::initModelRelations();

                $this->app->register(HookServiceProvider::class);
            });

            Language::setRoutesCachePath();
        }
    }

    public function addLanguageMiddlewareToPublicRoute(array $data): array
    {
        $locale = Language::setLocale();

        if (
            ! isset($data['prefix']) &&
            (! is_in_admin() || ! Language::hideDefaultLocaleInURL() || $locale !== Language::getDefaultLocale())
        ) {
            $data['prefix'] = trim((string) $locale);
        }

        $data['middleware'] = array_merge(Arr::get($data, 'middleware', []), [
            'localeSessionRedirect',
            'localizationRedirect',
        ]);

        $data['middleware'] = array_unique($data['middleware']);

        return $data;
    }
}
