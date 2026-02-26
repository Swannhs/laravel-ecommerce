<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\SortOrderFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\Fields\TreeCategoryField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Facades\ProductCategoryHelper;
use App\Plugins\Ecommerce\Forms\Fronts\Auth\FieldOptions\TextFieldOption;
use App\Plugins\Ecommerce\Http\Requests\BrandRequest;
use App\Plugins\Ecommerce\Models\Brand;

class BrandForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Brand::class)
            ->setValidatorClass(BrandRequest::class)
            ->add('name', TextField::class, NameFieldOption::make())
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add(
                'website',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/ecommerce::brands.form.website'))
                    ->placeholder(trans('plugins/ecommerce::brands.form.website_placeholder'))
                    ->maxLength(120)
            )
            ->add('order', NumberField::class, SortOrderFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add(
                'logo',
                MediaImageField::class,
                MediaImageFieldOption::make()
                    ->label(trans('plugins/ecommerce::brands.logo'))
            )
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
            )
            ->add(
                'categories[]',
                TreeCategoryField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/ecommerce::products.form.categories'))
                    ->choices(ProductCategoryHelper::getActiveTreeCategories())
                    ->selected($this->getModel()->getKey() ? $this->getModel()->categories->pluck('id')->all() : [])
                    ->addAttribute('card-body-class', 'p-0')
            )
            ->setBreakFieldPoint('status');
    }
}
