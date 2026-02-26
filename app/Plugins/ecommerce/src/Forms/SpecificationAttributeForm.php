<?php

namespace App\Plugins\Ecommerce\Forms;

use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\TextareaFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Core\Base\Forms\MetaBox;
use App\Plugins\Ecommerce\Enums\SpecificationAttributeFieldType;
use App\Plugins\Ecommerce\Http\Requests\SpecificationAttributeRequest;
use App\Plugins\Ecommerce\Models\SpecificationAttribute;
use App\Plugins\Ecommerce\Models\SpecificationGroup;

class SpecificationAttributeForm extends FormAbstract
{
    public function setup(): void
    {
        $options = $this->getModel()->options ?? [];
        $options = is_array($options) ? $options : json_decode($options, true);

        $this
            ->model(SpecificationAttribute::class)
            ->setValidatorClass(SpecificationAttributeRequest::class)
            ->add(
                'group_id',
                SelectField::class,
                SelectFieldOption::make()
                    ->required()
                    ->label(trans('plugins/ecommerce::product-specification.specification_attributes.group'))
                    ->attributes([
                        'placeholder' => trans('plugins/ecommerce::product-specification.specification_attributes.group_placeholder'),
                    ])
                    ->choices(SpecificationGroup::query()->pluck('name', 'id')->all())
            )
            ->add(
                'name',
                TextField::class,
                NameFieldOption::make()
                    ->required()
                    ->placeholder(trans('plugins/ecommerce::product-specification.specification_attributes.name_placeholder')),
            )
            ->add(
                'type',
                SelectField::class,
                SelectFieldOption::make()
                    ->required()
                    ->label(trans('plugins/ecommerce::product-specification.specification_attributes.type'))
                    ->placeholder(trans('plugins/ecommerce::product-specification.specification_attributes.type_placeholder'))
                    ->choices(SpecificationAttributeFieldType::labels())
            )
            ->add(
                'default_value',
                TextareaField::class,
                TextareaFieldOption::make()
                    ->label(trans('plugins/ecommerce::product-specification.specification_attributes.default_value'))
                    ->placeholder(trans('plugins/ecommerce::product-specification.specification_attributes.default_value_placeholder'))
            )
            ->addMetaBox(
                MetaBox::make('specification-attribute-options')
                    ->hasTable()
                    ->attributes([
                        'class' => 'specification-attribute-options',
                        'style' => sprintf(
                            'display: %s;',
                            in_array(old('type', $this->getModel()), [SpecificationAttributeFieldType::SELECT, SpecificationAttributeFieldType::RADIO]) ? 'block' : 'none;'
                        ),
                    ])
                    ->title(trans('plugins/ecommerce::product-specification.specification_attributes.options.heading'))
                    ->content(view('plugins/ecommerce::specification-attributes.partials.options', compact('options')))
                    ->footerContent(view('plugins/ecommerce::specification-attributes.partials.options-footer'))
            );
    }
}
