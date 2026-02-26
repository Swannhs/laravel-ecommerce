<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\ColorFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\ColorField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Ecommerce\Http\Requests\ProductLabelRequest;
use App\Plugins\Ecommerce\Models\ProductLabel;

class ProductLabelForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/product-label.js')
            ->addStylesDirectly('vendor/core/plugins/ecommerce/css/ecommerce.css');

        $this
            ->model(ProductLabel::class)
            ->setValidatorClass(ProductLabelRequest::class)
            ->add('name', TextField::class, NameFieldOption::make())
            ->add(
                'color',
                ColorField::class,
                ColorFieldOption::make()
                    ->label(trans('plugins/ecommerce::product-label.background_color'))
            )
            ->add(
                'text_color',
                ColorField::class,
                ColorFieldOption::make()
                    ->label(trans('plugins/ecommerce::product-label.text_color'))
                    ->helperText(trans('plugins/ecommerce::product-label.text_color_helper'))
                    ->defaultValue('#ffffff')
            )
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->setBreakFieldPoint('status');

        if ($this->getModel()->id) {
            $this->addMetaBoxes([
                'products' => [
                    'title' => trans('plugins/ecommerce::products.name'),
                    'content' => view('plugins/ecommerce::product-labels.products', [
                        'productLabel' => $this->getModel(),
                        'products' => $this->getModel()->products,
                    ]),
                    'priority' => 0,
                ],
            ]);
        }
    }
}
