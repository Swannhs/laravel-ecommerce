<?php

namespace App\Core\Setting\Forms;

use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\MultiChecklistFieldOption;
use App\Core\Base\Forms\FieldOptions\NumberFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\MultiCheckListField;
use App\Core\Base\Forms\Fields\NumberField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Base\Supports\Helper;
use App\Core\Setting\Http\Requests\PhoneNumberSettingRequest;

class PhoneNumberSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $countries = Helper::countries();
        $selectedCountries = json_decode(setting('phone_number_available_countries', '[]'), true) ?: array_keys($countries);

        $this
            ->setSectionTitle(trans('core/setting::setting.phone_number.title'))
            ->setSectionDescription(trans('core/setting::setting.phone_number.description'))
            ->setValidatorClass(PhoneNumberSettingRequest::class)
            ->add(
                'phone_number_enable_country_code',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/setting::setting.phone_number.enable_country_code'))
                    ->value($enableCountryCode = setting('phone_number_enable_country_code', true))
                    ->helperText(trans('core/setting::setting.phone_number.enable_country_code_helper'))
            )
            ->addOpenCollapsible('phone_number_enable_country_code', '1', $enableCountryCode == '1')
            ->add(
                'phone_number_available_countries_all',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('core/setting::setting.phone_number.all'))
                    ->labelAttributes(['class' => 'check-all', 'data-set' => '.phone-available-countries'])
                    ->helperText(trans('core/setting::setting.phone_number.all_helper_text'))
                    ->value(count($selectedCountries) == count($countries) ? '1' : '')
            )
            ->add(
                'phone_number_available_countries[]',
                MultiCheckListField::class,
                MultiChecklistFieldOption::make()
                    ->label(trans('core/setting::setting.phone_number.available_countries'))
                    ->choices($countries)
                    ->selected($selectedCountries)
                    ->attributes(['class' => 'phone-available-countries'])
            )
            ->addCloseCollapsible('phone_number_enable_country_code', '1')
            ->add(
                'phone_number_min_length',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(trans('core/setting::setting.phone_number.min_length'))
                    ->value(setting('phone_number_min_length', 8))
                    ->helperText(trans('core/setting::setting.phone_number.min_length_helper'))
                    ->attributes(['min' => 1, 'max' => 20])
            )
            ->add(
                'phone_number_max_length',
                NumberField::class,
                NumberFieldOption::make()
                    ->label(trans('core/setting::setting.phone_number.max_length'))
                    ->value(setting('phone_number_max_length', 15))
                    ->helperText(trans('core/setting::setting.phone_number.max_length_helper'))
                    ->attributes(['min' => 1, 'max' => 30])
            )
            ->add(
                'phone_number_note',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(sprintf(
                        '<div class="alert alert-info mb-0 d-block">%s</div>',
                        trans('core/setting::setting.phone_number.note_content')
                    ))
            );
    }
}
