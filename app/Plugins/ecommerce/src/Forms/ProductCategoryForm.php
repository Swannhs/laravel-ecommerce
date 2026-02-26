<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\ContentFieldOption;
use App\Core\Base\Forms\FieldOptions\CoreIconFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\CoreIconField;
use App\Core\Base\Forms\Fields\EditorField;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Facades\ProductCategoryHelper;
use App\Plugins\Ecommerce\Http\Requests\ProductCategoryRequest;
use App\Plugins\Ecommerce\Models\ProductCategory;
use App\Core\Support\Services\Cache\Cache;
use Carbon\Carbon;

class ProductCategoryForm extends FormAbstract
{
    public function setup(): void
    {
        $cache = Cache::make(ProductCategory::class);

        $cacheKey = 'ecommerce_categories_for_rendering_parent_select' . md5($cache->generateCacheKeyFromInput() . serialize(func_get_args()));

        if ($cache->has($cacheKey) && ($cachedCategories = $cache->get($cacheKey))) {
            $categories = $cachedCategories;
        } else {
            $categories = ProductCategoryHelper::getTreeCategoriesOptions(
                ProductCategoryHelper::getTreeCategories(false, [
                    'id',
                    'name',
                    'parent_id',
                    'status',
                    'order',
                ])
            );

            $categories = [0 => trans('plugins/ecommerce::product-categories.none')] + $categories;

            $cache->put($cacheKey, $categories, Carbon::now()->addHours(2));
        }

        $maxOrder = ProductCategory::query()
            ->whereIn('parent_id', [0, null])
            ->latest('order')
            ->value('order');

        $this
            ->model(ProductCategory::class)
            ->setValidatorClass(ProductCategoryRequest::class)
            ->add(
                'order',
                'hidden',
                TextFieldOption::make()
                    ->value($this->getModel()->exists ? $this->getModel()->order : $maxOrder + 1)
            )
            ->add('name', TextField::class, NameFieldOption::make())
            ->add(
                'parent_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('core/base::forms.parent'))
                    ->choices($categories)
                    ->searchable()
            )
            ->add(
                'description',
                EditorField::class,
                ContentFieldOption::make()
                    ->label(trans('core/base::forms.description'))
                    ->allowedShortcodes()
            )
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->add(
                'icon',
                CoreIconField::class,
                CoreIconFieldOption::make()
            )
            ->add('icon_image', MediaImageField::class, [
                'label' => __('Icon image'),
                'help_block' => [
                    'text' => __('It will replace Icon Font if it is present.'),
                ],
                'wrapper' => [
                    'style' => 'display: block;',
                ],
            ])
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
            )
            ->setBreakFieldPoint('status');
    }
}
