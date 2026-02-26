<?php

namespace App\Plugins\Location\Forms;

use App\Core\Base\Forms\FieldOptions\IsDefaultFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\SortOrderFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Location\Http\Requests\StateRequest;
use App\Plugins\Location\Models\Country;
use App\Plugins\Location\Models\State;

class StateForm extends FormAbstract
{
    public function setup(): void
    {
        $countries = Country::query()->pluck('name', 'id')->all();

        $this
            ->model(State::class)
            ->setValidatorClass(StateRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('slug', TextField::class, [
                'label' => trans('plugins/location::location.slug'),
                'attr' => [
                    'placeholder' => trans('plugins/location::location.slug'),
                    'data-counter' => 120,
                ],
            ])
            ->add('abbreviation', TextField::class, [
                'label' => trans('plugins/location::location.abbreviation'),
                'attr' => [
                    'placeholder' => trans('plugins/location::location.abbreviation_placeholder'),
                    'data-counter' => 10,
                ],
            ])
            ->add('country_id', SelectField::class, [
                'label' => trans('plugins/location::state.country'),
                'required' => true,
                'attr' => [
                    'class' => 'select-search-full',
                ],
                'choices' => [0 => trans('plugins/location::state.select_country')] + $countries,
            ])
            ->add('order', NumberField::class, SortOrderFieldOption::make())
            ->add('is_default', OnOffField::class, IsDefaultFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
