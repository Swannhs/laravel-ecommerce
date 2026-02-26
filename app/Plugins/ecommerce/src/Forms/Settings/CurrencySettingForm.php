<?php

namespace App\Plugins\Ecommerce\Forms\Settings;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\AlertFieldOption;
use App\Core\Base\Forms\Fields\AlertField;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Plugins\Ecommerce\Http\Requests\Settings\CurrencySettingRequest;
use App\Plugins\Ecommerce\Models\Currency;
use App\Core\Setting\Forms\SettingForm;

class CurrencySettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        Assets::addScripts(['jquery-ui'])
            ->addScriptsDirectly('vendor/core/plugins/ecommerce/js/currencies.js')
            ->addStylesDirectly('vendor/core/plugins/ecommerce/css/currencies.css');

        $currencies = Currency::query()
            ->oldest('order')
            ->get()
        ;

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.currency.name'))
            ->setSectionDescription(trans('plugins/ecommerce::setting.currency.currency_setting_description'))
            ->setFormOptions([
                'class' => 'currency-setting-form',
            ])
            ->contentOnly()
            ->setValidatorClass(CurrencySettingRequest::class)
            ->add('enable_auto_detect_visitor_currency', OnOffCheckboxField::class, [
                'label' => trans('plugins/ecommerce::setting.currency.form.enable_auto_detect_visitor_currency'),
                'value' => get_ecommerce_setting('enable_auto_detect_visitor_currency', false),
                'help_block' => [
                    'text' => trans(
                        'plugins/ecommerce::setting.currency.form.enable_auto_detect_visitor_currency_helper'
                    ),
                ],
            ])
            ->add('add_space_between_price_and_currency', OnOffCheckboxField::class, [
                'label' => trans('plugins/ecommerce::setting.currency.form.add_space_between_price_and_currency'),
                'value' => get_ecommerce_setting('add_space_between_price_and_currency', false),
                'help_block' => [
                    'text' => trans('plugins/ecommerce::setting.currency.form.add_space_between_price_and_currency_helper'),
                ],
            ])
            ->add('thousands_separator', SelectField::class, [
                'label' => trans('plugins/ecommerce::setting.currency.form.thousands_separator'),
                'selected' => get_ecommerce_setting('thousands_separator', ','),
                'choices' => [
                    ',' => trans('plugins/ecommerce::setting.currency.form.separator_comma'),
                    '.' => trans('plugins/ecommerce::setting.currency.form.separator_period'),
                    'space' => trans('plugins/ecommerce::setting.currency.form.separator_space'),
                ],
                'help_block' => [
                    'text' => trans('plugins/ecommerce::setting.currency.form.thousands_separator_helper'),
                ],
            ])
            ->add('decimal_separator', SelectField::class, [
                'label' => trans('plugins/ecommerce::setting.currency.form.decimal_separator'),
                'selected' => get_ecommerce_setting('decimal_separator', '.'),
                'choices' => [
                    ',' => trans('plugins/ecommerce::setting.currency.form.separator_comma'),
                    '.' => trans('plugins/ecommerce::setting.currency.form.separator_period'),
                    'space' => trans('plugins/ecommerce::setting.currency.form.separator_space'),
                ],
                'help_block' => [
                    'text' => trans('plugins/ecommerce::setting.currency.form.decimal_separator_helper'),
                ],
            ])
            ->add('api_provider_field', HtmlField::class, [
                'html' => view('plugins/ecommerce::settings.partials.currencies.api-provider-fields'),
            ])
            ->add('use_exchange_rate_from_api', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.currency.form.use_exchange_rate_from_api'),
                'value' => get_ecommerce_setting('use_exchange_rate_from_api', false),
                'help_block' => [
                    'text' => trans('plugins/ecommerce::setting.currency.form.use_exchange_rate_from_api_helper'),
                ],
            ])
            ->add('data_currencies', HtmlField::class, [
                'html' => view(
                    'plugins/ecommerce::settings.partials.currencies.data-currency-fields',
                    compact('currencies')
                ),
            ])
            ->add('currency_table', HtmlField::class, [
                'html' => view('plugins/ecommerce::settings.partials.currencies.currency-table'),
            ])
            ->add(
                'default_currency_warning',
                AlertField::class,
                AlertFieldOption::make()->type('warning')->content(
                    trans('plugins/ecommerce::setting.currency.form.default_currency_warning')
                )
            );
    }
}
