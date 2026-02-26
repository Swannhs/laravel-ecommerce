<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\Html;
use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Http\Requests\ProductCollectionRequest;
use App\Plugins\Ecommerce\Models\ProductCollection;

class ProductCollectionForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addStylesDirectly('vendor/core/plugins/ecommerce/css/ecommerce.css')
            ->addScriptsDirectly('vendor/core/plugins/ecommerce/js/edit-product-collection.js');

        $this
            ->model(ProductCollection::class)
            ->setValidatorClass(ProductCollectionRequest::class)
            ->add(
                'name',
                TextField::class,
                NameFieldOption::make()
                    ->when($this->getModel()->slug, function (NameFieldOption $option, string $slug): void {
                        $option
                            ->helperText(trans('plugins/ecommerce::product-collections.slug_help_block', compact('slug')));
                    })
            )
            ->add('slug', 'text', [
                'label' => trans('core/base::forms.slug'),
                'required' => true,
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add(
                'is_featured',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/base::forms.is_featured'))
                    ->defaultValue(false)
            )
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->setBreakFieldPoint('status');

        if ($productCollectionId = $this->getModel()->id) {
            $this
                ->addMetaBoxes([
                    'collection-products' => [
                        'title' => trans('plugins/ecommerce::products.name'),
                        'content' =>
                            Html::tag('div', '', [
                                'class' => 'wrap-collection-products',
                                'data-target' => route('product-collections.get-product-collection', $productCollectionId),
                            ]),
                        'priority' => 9999,
                    ],
            ]);
        }
    }
}
