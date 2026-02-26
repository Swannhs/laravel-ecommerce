<?php

namespace App\Plugins\Payment\Concerns\Forms;

use App\Core\Base\Forms\FieldOptions\CheckboxFieldOption;
use App\Core\Base\Forms\FieldOptions\LabelFieldOption;
use App\Core\Base\Forms\FieldOptions\MultiChecklistFieldOption;
use App\Core\Base\Forms\Fields\LabelField;
use App\Core\Base\Forms\Fields\MultiCheckListField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Base\Supports\Helper;
use App\Plugins\Payment\Supports\PaymentHelper;

trait HasAvailableCountriesField
{
    protected function addAvailableCountriesField(string $paymentMethod): static
    {
        $countries = Helper::countries();
        $selected = array_keys(PaymentHelper::getAvailableCountries($paymentMethod));

        return $this
            ->add(
                get_payment_setting_key('available_countries_label', $paymentMethod),
                LabelField::class,
                LabelFieldOption::make()
                    ->label(trans('plugins/payment::payment.available_countries'))
                    ->helperText(trans('plugins/payment::payment.available_countries_help'))
            )
            ->add(
                get_payment_setting_key('available_countries_checkall', $paymentMethod),
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/payment::payment.all_countries_checkbox'))
                    ->labelAttributes(['class' => 'check-all', 'data-set' => ".$paymentMethod-available-countries"])
                    ->value(array_diff(array_keys($countries), $selected) ? 0 : 1)
            )
            ->add(
                get_payment_setting_key('available_countries[]', $paymentMethod),
                MultiCheckListField::class,
                MultiChecklistFieldOption::make()
                    ->label(false)
                    ->choices($countries)
                    ->selected($selected)
                    ->attributes(['class' => "$paymentMethod-available-countries"])
            );
    }
}
