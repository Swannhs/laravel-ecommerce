<?php

namespace App\Plugins\SimpleSlider\Forms;

use App\Core\Base\Forms\FieldOptions\DescriptionFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\SortOrderFieldOption;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\SimpleSlider\Http\Requests\SimpleSliderItemRequest;
use App\Plugins\SimpleSlider\Models\SimpleSliderItem;

class SimpleSliderItemForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(SimpleSliderItem::class)
            ->setValidatorClass(SimpleSliderItemRequest::class)
            ->contentOnly()
            ->add('simple_slider_id', 'hidden', [
                'value' => $this->getRequest()->input('simple_slider_id'),
            ])
            ->add('title', TextField::class, [
                'label' => trans('core/base::forms.title'),
                'attr' => [
                    'data-counter' => 120,
                ],
            ])
            ->add('link', TextField::class, [
                'label' => trans('core/base::forms.link'),
                'attr' => [
                    'placeholder' => 'https://',
                    'data-counter' => 120,
                ],
            ])
            ->add('description', TextareaField::class, DescriptionFieldOption::make())
            ->add('order', NumberField::class, SortOrderFieldOption::make())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make()->required());
    }
}
