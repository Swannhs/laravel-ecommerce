<?php

namespace App\Plugins\LanguageAdvanced\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\Language\Facades\Language;
use App\Plugins\Language\Models\Language as LanguageModel;
use App\Plugins\LanguageAdvanced\Exporters\TranslationExporterManager;
use App\Plugins\LanguageAdvanced\Importers\TranslationImporterManager;
use App\Plugins\LanguageAdvanced\Supports\LanguageAdvancedManager;
use App\Packages\Page\Models\Page;
use App\Core\Setting\Facades\Setting;
use App\Packages\Slug\Models\Slug;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;

class LanguageAdvancedServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->singleton(TranslationImporterManager::class, function () {
            return new TranslationImporterManager();
        });

        $this->app->singleton(TranslationExporterManager::class, function () {
            return new TranslationExporterManager();
        });
    }

    public function boot(): void
    {
        $this->setNamespace('plugins/language-advanced')
            ->loadMigrations();

        if (! is_plugin_active('language')) {
            return;
        }

        $this
            ->loadHelpers()
            ->loadAndPublishConfigurations(['general'])
            ->loadAndPublishConfigurations(['permissions'])
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes();

        $this->app->register(EventServiceProvider::class);

        if (! $this->app->runningInConsole()) {
            add_filter('slug_helper_get_permalink_setting_key', [$this, 'getPermalinkSettingKey'], 1134, 2);
        }

        $this->app->booted(function (): void {
            LanguageAdvancedManager::initModelRelations();

            $this->app->register(HookServiceProvider::class);
        });

        $config = $this->app['config'];

        if ($config->get('plugins.language-advanced.general.page_use_language_v2')) {
            LanguageAdvancedManager::registerModule(Page::class, [
                'name',
                'description',
                'content',
            ]);

            LanguageAdvancedManager::registerModule(Slug::class, [
                'key',
                'prefix',
            ]);

            $supportedModels = Language::supportedModels();

            if (($key = array_search(Page::class, $supportedModels)) !== false) {
                unset($supportedModels[$key]);
            }

            $config->set(['plugins.language.general.supported' => $supportedModels]);
        }

        $this->app['events']->listen('eloquent.deleted: ' . LanguageModel::class, function (LanguageModel $language): void {
            foreach (LanguageAdvancedManager::getSupported() as $model => $columns) {
                if (class_exists($model)) {
                    DB::table((new $model())->getTable() . '_translations')
                        ->where('lang_code', $language->lang_code)
                        ->delete();
                }
            }
        });

        foreach (LanguageAdvancedManager::getSupported() as $model => $columns) {
            $this->app['events']->listen('eloquent.deleted: ' . $model, function (Model $model): void {
                DB::table($model->getTable() . '_translations')
                    ->where($model->getTable() . '_id', $model->getKey())
                    ->delete();
            });
        }
    }

    public function getPermalinkSettingKey(string $key): string
    {
        $currentLocale = is_in_admin(true) ? Language::getCurrentAdminLocale() : Language::getCurrentLocale();
        $locale = $currentLocale !== Language::getDefaultLocale() ? $currentLocale : null;

        if ($locale && in_array($locale, array_keys(Language::getSupportedLocales()))) {
            $keyLocale = "$key-$locale";

            if (is_in_admin(true) && Route::is('slug.settings')) {
                return $keyLocale;
            }

            return Setting::has($keyLocale) ? $keyLocale : $key;
        }

        return $key;
    }
}
