<?php

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\TagFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\TagField;
use App\Core\Base\Forms\Fields\TextField;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Marketplace\Models\Store;
use App\Packages\Shortcode\Compilers\Shortcode;
use App\Packages\Shortcode\Forms\ShortcodeForm;
use App\Packages\Theme\Facades\Theme;

if (is_plugin_active('marketplace')) {
    Assets::addStylesDirectly('vendor/core/core/base/libraries/tagify/tagify.css');

    add_shortcode('marketplace-stores', __('Marketplace Stores'), __('Marketplace Stores'), function (Shortcode $shortcode) {
        $storeIds = [];

        if ($shortcode->stores) {
            $storeIds = explode(',', $shortcode->stores);
        }

        if (empty($storeIds)) {
            return null;
        }

        $with = ['slugable'];
        if (EcommerceHelper::isReviewEnabled()) {
            $with['reviews'] = function ($query): void {
                $query->where([
                    'ec_products.status' => BaseStatusEnum::PUBLISHED,
                    'ec_reviews.status' => BaseStatusEnum::PUBLISHED,
                ]);
            };
        }

        $stores = Store::query()
            ->wherePublished()
            ->whereIn('id', $storeIds)
            ->with($with)
            ->withCount([
                'products' => function ($query): void {
                    $query->wherePublished();
                },
            ])
            ->orderByDesc('created_at')
            ->get();

        return Theme::partial('short-codes.marketplace.stores', compact('shortcode', 'stores'));
    });

    shortcode()->setAdminConfig('marketplace-stores', function (array $attributes) {
        $stores = Store::query()
            ->wherePublished()
            ->orderBy('name')
            ->pluck('name', 'id')
            ->mapWithKeys(function ($name, $id) {
                return [$id => ['value' => $id, 'label' => $name]];
            })
            ->all();

        Assets::addScriptsDirectly([
            'vendor/core/core/base/libraries/tagify/tagify.js',
            'vendor/core/core/base/js/tags.js',
        ]);

        return ShortcodeForm::createFromArray($attributes)
            ->withLazyLoading()
            ->add(
                'title',
                TextField::class,
                TextFieldOption::make()
                    ->label(__('Title'))
                    ->placeholder(__('Title'))
            )
            ->add(
                'stores',
                TagField::class,
                TagFieldOption::make()
                    ->label(__('Stores'))
                    ->placeholder(__('Select stores from the list'))
                    ->addAttribute('class', 'list-tagify')
                    ->addAttribute('data-list', json_encode($stores))
            );
    });

    shortcode()->registerLoadingState('marketplace-stores', Theme::getThemeNamespace('partials.short-codes.marketplace.stores-skeleton'));
}
