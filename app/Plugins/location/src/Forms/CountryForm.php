<?php

namespace App\Plugins\Location\Forms;

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
use App\Plugins\Location\Http\Requests\CountryRequest;
use App\Plugins\Location\Models\Country;

class CountryForm extends FormAbstract
{
    public function setup(): void
    {
        $this
            ->model(Country::class)
            ->setValidatorClass(CountryRequest::class)
            ->add('name', TextField::class, NameFieldOption::make()->required())
            ->add(
                'code',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/location::country.code'))
                    ->placeholder(trans('plugins/location::country.code_placeholder'))
                    ->maxLength(3)
                    ->helperText(trans('plugins/location::country.code_helper'))
                    ->required()
            )
            ->add(
                'nationality',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/location::country.nationality'))
                    ->placeholder(trans('plugins/location::country.nationality'))
                    ->maxLength(120)
            )
            ->add('order', NumberField::class, SortOrderFieldOption::make())
            ->add('is_default', OnOffField::class, IsDefaultFieldOption::make())
            ->add('status', SelectField::class, StatusFieldOption::make())
            ->add('image', MediaImageField::class, MediaImageFieldOption::make())
            ->setBreakFieldPoint('status');
    }
}
