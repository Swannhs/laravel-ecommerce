<?php

namespace App\Plugins\Location\Forms;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\IsDefaultFieldOption;
use App\Core\Base\Forms\FieldOptions\MediaImageFieldOption;
use App\Core\Base\Forms\FieldOptions\NameFieldOption;
use App\Core\Base\Forms\FieldOptions\SortOrderFieldOption;
use App\Core\Base\Forms\FieldOptions\StatusFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\MediaImageField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\OnOffField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Location\Http\Requests\CityRequest;
use App\Plugins\Location\Models\City;
use App\Plugins\Location\Models\Country;

class CityForm extends FormAbstract
{
    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/location/js/location.js');

        $countries = Country::query()->pluck('name', 'id')->all();

        $states = [];
        if ($this->getModel()) {
            $states = $this->getModel()->country->states()->pluck('name', 'id')->all();
        }

        $this
            ->model(City::class)
            ->setValidatorClass(CityRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add('slug', TextField::class, [
                'label' => trans('plugins/location::location.slug'),
                'attr' => [
                    'placeholder' => trans('plugins/location::location.slug'),
                    'data-counter' => 120,
                ],
            ])
            ->add('country_id', SelectField::class, [
                'label' => trans('plugins/location::city.country'),
                'required' => true,
                'attr' => [
                    'id' => 'country_id',
                    'class' => 'select-search-full',
                    'data-type' => 'country',
                ],
                'choices' => [0 => trans('plugins/location::city.select_country')] + $countries,
            ])
            ->add('state_id', SelectField::class, [
                'label' => trans('plugins/location::city.state'),
                'attr' => [
                    'id' => 'state_id',
                    'data-url' => route('ajax.states-by-country'),
                    'class' => 'select-search-full',
                    'data-type' => 'state',
                ],
                'choices' => ($this->getModel()->state_id ?
                        [
                            0 => trans('plugins/location::city.select_state'),
                            $this->model->state->id => $this->model->state->name,
                        ]
                        :
                        [0 => trans('plugins/location::city.select_state')]) + $states,
            ])
            ->add(
                'zip_code',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/location::city.zip_code'))
                    ->helperText(trans('plugins/location::city.zip_code_helper'))
            )
            ->add('order', NumberField::class, SortOrderFieldOption::make())
            ->add('is_default', OnOffField::class, IsDefaultFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
