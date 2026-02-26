<?php

namespace App\Packages\Slug\Providers;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\MacroableModels;
use App\Core\Base\Facades\PanelSectionManager;
use App\Core\Base\Models\BaseModel;
use App\Core\Base\PanelSections\PanelSectionItem;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Packages\Page\Models\Page;
use App\Core\Setting\PanelSections\SettingCommonPanelSection;
use App\Packages\Slug\Facades\SlugHelper as SlugHelperFacade;
use App\Packages\Slug\Models\Slug;
use App\Packages\Slug\Repositories\Eloquent\SlugRepository;
use App\Packages\Slug\Repositories\Interfaces\SlugInterface;
use App\Packages\Slug\SlugCompiler;
use App\Packages\Slug\SlugHelper;
use Illuminate\Database\Eloquent\Model;

class SlugServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function register(): void
    {
        $this->app->bind(SlugInterface::class, function () {
            return new SlugRepository(new Slug());
        });

        $this->app->singleton(SlugHelper::class, function () {
            return new SlugHelper(new SlugCompiler());
        });
    }

    public function boot(): void
    {
        $this
            ->setNamespace('packages/slug')
            ->loadAndPublishConfigurations(['general'])
            ->loadHelpers()
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->loadRoutes()
            ->loadMigrations()
            ->publishAssets();

        $this->app->register(EventServiceProvider::class);
        $this->app->register(CommandServiceProvider::class);

        PanelSectionManager::default()->beforeRendering(function (): void {
            PanelSectionManager::registerItem(
                SettingCommonPanelSection::class,
                fn () => PanelSectionItem::make('permalink')
                    ->setTitle(trans('packages/slug::slug.permalink_settings'))
                    ->withIcon('ti ti-link')
                    ->withDescription(trans('packages/slug::slug.permalink_settings_description'))
                    ->withPriority(90)
                    ->withRoute('slug.settings')
                    ->withPermission('settings.options')
            );
        });

        $this->app->booted(function (): void {
            $this->app->register(FormServiceProvider::class);

            $supportedModels = array_keys($this->app->make(SlugHelper::class)->supportedModels());

            foreach ($supportedModels as $item) {
                if (! class_exists($item)) {
                    continue;
                }

                /**
                 * @var BaseModel $item
                 */
                $item::resolveRelationUsing('slugable', function ($model) {
                    return $model->morphOne(Slug::class, 'reference')->select([
                        'id',
                        'key',
                        'reference_type',
                        'reference_id',
                        'prefix',
                    ]);
                });

                if (! method_exists($item, 'getSlugAttribute') && ! method_exists($item, 'slug') && ! property_exists($item, 'slug')) {
                    MacroableModels::addMacro($item, 'getSlugAttribute', function () {
                        /**
                         * @var BaseModel $this
                         */
                        return $this->slugable ? $this->slugable->key : '';
                    });
                }

                if (! method_exists($item, 'getSlugIdAttribute') && ! method_exists($item, 'slugId') && ! property_exists($item, 'slug_id')) {
                    MacroableModels::addMacro($item, 'getSlugIdAttribute', function () {
                        /**
                         * @var BaseModel $this
                         */
                        return $this->slugable ? $this->slugable->getKey() : '';
                    });
                }

                if (! method_exists($item, 'getUrlAttribute') && ! method_exists($item, 'url') && ! property_exists($item, 'url')) {
                    MacroableModels::addMacro(
                        $item,
                        'getUrlAttribute',
                        function () {
                            /**
                             * @var BaseModel $model
                             */
                            $model = $this;

                            $slug = $model->slugable;

                            if (
                                ! $slug ||
                                ! $slug->key ||
                                ($model instanceof Page && BaseHelper::isHomepage($model->getKey()))
                            ) {
                                return BaseHelper::getHomepageUrl();
                            }

                            $prefix = SlugHelperFacade::getTranslator()->compile(
                                apply_filters(FILTER_SLUG_PREFIX, $slug->prefix),
                                $model
                            );

                            return apply_filters(
                                'slug_filter_url',
                                url(ltrim($prefix . '/' . $slug->key, '/')) . SlugHelperFacade::getPublicSingleEndingURL()
                            );
                        }
                    );
                }

                $this->app['events']->listen('eloquent.deleted: ' . $item, function (Model $model): void {
                    Slug::query()
                        ->where('reference_type', $model::class)
                        ->where('reference_id', $model->getKey())
                        ->each(fn (Slug $slug) => $slug->delete());
                });
            }

            $this->app->register(HookServiceProvider::class);
        });
    }

    public function provides(): array
    {
        return [
            SlugHelper::class,
        ];
    }
}
