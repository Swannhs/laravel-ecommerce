<?php

namespace App\Plugins\Ads\Providers;

use App\Plugins\Ads\Facades\AdsManager;
use App\Plugins\Ads\Forms\AdsForm;
use App\Plugins\Ads\Models\Ads;
use App\Plugins\Ads\Repositories\Eloquent\AdsRepository;
use App\Plugins\Ads\Repositories\Interfaces\AdsInterface;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\LanguageAdvanced\Supports\LanguageAdvancedManager;
use App\Core\Setting\PanelSections\SettingOthersPanelSection;
use App\Packages\Shortcode\Facades\Shortcode;
use App\Packages\Shortcode\Forms\ShortcodeForm;
use Illuminate\Contracts\Support\DeferrableProvider;
use Illuminate\Foundation\AliasLoader;
use Illuminate\Routing\Events\RouteMatched;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;
use Throwable;

class AdsServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(AdsInterface::class, function () {
            return new AdsRepository(new Ads());
        });

        AliasLoader::getInstance()->alias('AdsManager', AdsManager::class);
    }

    public function boot(): void
    {
        $this
            ->setNamespace('plugins/ads')
            ->loadAndPublishConfigurations(['permissions', 'general'])
            ->loadMigrations()
            ->loadAndPublishTranslations()
            ->loadRoutes(['web', 'api'])
            ->loadHelpers()
            ->loadAndPublishViews();

        DashboardMenu::beforeRetrieving(function (): void {
            DashboardMenu::make()
                ->registerItem([
                    'id' => 'cms-plugins-ads',
                    'priority' => 8,
                    'icon' => 'ti ti-ad-circle',
                    'name' => 'plugins/ads::ads.name',
                    'permissions' => ['ads.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-ads-list',
                    'parent_id' => 'cms-plugins-ads',
                    'priority' => 1,
                    'name' => 'plugins/ads::ads.name',
                    'icon' => 'ti ti-list',
                    'url' => fn () => route('ads.index'),
                    'permissions' => ['ads.index'],
                ])
                ->registerItem([
                    'id' => 'cms-plugins-ads-setting',
                    'parent_id' => 'cms-plugins-ads',
                    'priority' => 2,
                    'name' => 'plugins/ads::ads.settings.title',
                    'icon' => 'ti ti-settings',
                    'url' => fn () => route('ads.settings'),
                    'permissions' => ['ads.index'],
                ]);
        });

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingOthersPanelSection::class,
                fn () => PanelSectionItem::make('ads')
                    ->setTitle(trans('plugins/ads::ads.settings.title'))
                    ->withIcon('ti ti-ad-circle')
                    ->withPriority(480)
                    ->withDescription(trans('plugins/ads::ads.settings.description'))
                    ->withRoute('ads.settings')
            );
        });

        $this->app['events']->listen(RouteMatched::class, function (): void {
            if (class_exists(Shortcode::class)) {
                Shortcode::register('ads', trans('plugins/ads::ads.name'), trans('plugins/ads::ads.name'), function ($shortcode) {
                    if (! $shortcode->key) {
                        return null;
                    }

                    return AdsManager::displayAds((string) $shortcode->key);
                });

                Shortcode::setAdminConfig('ads', function ($attributes) {
                    $ads = Ads::query()
                        ->wherePublished()
                        ->pluck('name', 'key')
                        ->all();

                    return ShortcodeForm::createFromArray($attributes)
                        ->withLazyLoading()
                        ->add(
                            'key',
                            SelectField::class,
                            SelectFieldOption::make()
                                ->label(trans('plugins/ads::ads.select_ad'))
                                ->choices($ads)
                        );
                });
            }
        });

        if (defined('LANGUAGE_MODULE_SCREEN_NAME') && defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME')) {
            LanguageAdvancedManager::registerModule(Ads::class, [
                'name',
                'image',
                'tablet_image',
                'mobile_image',
                'url',
            ]);
        }

        if (defined('THEME_FRONT_HEADER')) {
            add_filter(THEME_FRONT_HEADER, function ($html) {
                $autoAds = setting('ads_google_adsense_auto_ads');
                $clientId = setting('ads_google_adsense_unit_client_id');

                if ($autoAds) {
                    return $html . $autoAds;
                }

                if ($clientId) {
                    return $html . view('plugins/ads::partials.google-adsense.unit-ads-header', compact('clientId'))->render();
                }

                return $html;
            }, 128);

            add_filter(THEME_FRONT_FOOTER, function ($html) {
                $clientId = setting('ads_google_adsense_unit_client_id');
                $autoAds = setting('ads_google_adsense_auto_ads');

                if ($clientId && ! $autoAds) {
                    return $html . view('plugins/ads::partials.google-adsense.unit-ads-footer')->render();
                }

                return $html;
            }, 128);
        }

        try {
            add_filter('ads_render', function (?string $html, string|array $location, array $attributes = []) {
                if (! is_string($location)) {
                    return null;
                }

                return $html . AdsManager::display($location, $attributes);
            }, 128, 3);
        } catch (Throwable $exception) {
            BaseHelper::logError($exception);
        }

        AdsForm::beforeRendering(function (): void {
            add_action(BASE_ACTION_TOP_FORM_CONTENT_NOTIFICATION, function ($request, $data = null) {
                if (! $data instanceof Ads || ! in_array(Route::currentRouteName(), ['ads.create', 'ads.edit'])) {
                    return false;
                }

                echo view('plugins/ads::partials.notification')
                    ->render();

                return true;
            }, 45, 2);
        });
    }

    public function provides(): array
    {
        return [
            AdsInterface::class,
            'AdsManager',
        ];
    }
}
