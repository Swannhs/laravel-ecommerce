<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\SortOrderFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TreeCategoryField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Facades\ProductCategoryHelper;
use App\Plugins\Ecommerce\Http\Requests\ProductAttributeSetsRequest;
use App\Plugins\Ecommerce\Models\ProductAttributeSet;
use App\Plugins\Language\Facades\Language;

class ProductAttributeSetForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScripts('jquery-ui')
            ->addStylesDirectly('vendor/core/plugins/ecommerce/css/ecommerce-product-attributes.css')
            ->addScriptsDirectly('vendor/core/plugins/ecommerce/js/ecommerce-product-attributes.js');

        $displayLayout = [
            'dropdown' => trans('plugins/ecommerce::product-attribute-sets.dropdown_swatch'),
            'visual' => trans('plugins/ecommerce::product-attribute-sets.visual_swatch'),
            'text' => trans('plugins/ecommerce::product-attribute-sets.text_swatch'),
        ];

        $attributes = [];

        if ($this->getModel()) {
            $attributes = $this->getModel()->attributes;
        }

        $isNotDefaultLanguage = defined('LANGUAGE_ADVANCED_MODULE_SCREEN_NAME') &&
            $this->request->input('ref_lang') &&
            $this->request->input('ref_lang') != Language::getDefaultLocaleCode();

        $this
            ->model(ProductAttributeSet::class)
            ->setValidatorClass(ProductAttributeSetsRequest::class)
            ->setFormOption('class', 'update-attribute-set-form')
            ->add('title', 'text', [
                'label' => trans('core/base::forms.title'),
                'required' => true,
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('use_image_from_product_variation', 'onOff', [
                'label' => trans('plugins/ecommerce::product-attribute-sets.use_image_from_product_variation'),
                'default_value' => false,
            ])
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add('display_layout', 'customSelect', [
                'label' => trans('plugins/ecommerce::product-attribute-sets.display_layout'),
                'required' => true,
                'choices' => $displayLayout,
            ])
            ->add('is_searchable', 'onOff', [
                'label' => trans('plugins/ecommerce::product-attribute-sets.searchable'),
                'default_value' => false,
            ])
            ->add('is_comparable', 'onOff', [
                'label' => trans('plugins/ecommerce::product-attribute-sets.comparable'),
                'default_value' => false,
            ])
            ->add('is_use_in_product_listing', 'onOff', [
                'label' => trans('plugins/ecommerce::product-attribute-sets.use_in_product_listing'),
                'default_value' => false,
            ])
            ->add('order', NumberField::class, SortOrderFieldOption::make())
            ->add(
                'categories[]',
                TreeCategoryField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::products.form.categories'))
                    ->choices(ProductCategoryHelper::getActiveTreeCategories())
                    ->selected($this->getModel()->id ? $this->getModel()->categories->pluck('id')->all() : [])
                    ->addAttribute('card-body-class', 'p-0')
            )
            ->setBreakFieldPoint('status')
            ->addMetaBoxes([
                'attributes_list' => [
                    'title' => trans('plugins/ecommerce::product-attribute-sets.attributes_list'),
                    'content' => view(
                        'plugins/ecommerce::product-attributes.sets.list',
                        compact('attributes', 'isNotDefaultLanguage')
                    )->render(),
                    'header_actions' => ! $isNotDefaultLanguage
                        ? view('plugins/ecommerce::product-attributes.sets.actions')->render()
                        : null,
                    'has_table' => true,
                ],
            ]);
    }
}
