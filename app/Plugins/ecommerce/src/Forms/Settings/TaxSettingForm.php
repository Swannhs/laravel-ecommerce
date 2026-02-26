<?php

namespace App\Plugins\Ecommerce\Forms\Settings;

use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Http\Requests\Settings\TaxSettingRequest;
use App\Plugins\Ecommerce\Models\Tax;
use App\Core\Setting\Forms\SettingForm;

class TaxSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/ecommerce::setting.tax.tax_setting'))
            ->setSectionDescription(trans('plugins/ecommerce::setting.tax.tax_setting_description'))
            ->contentOnly()
            ->setValidatorClass(TaxSettingRequest::class)
            ->add('ecommerce_tax_enabled', OnOffCheckboxField::class, [
                'label' => trans('plugins/ecommerce::setting.tax.form.enable_tax'),
                'value' => EcommerceHelper::isTaxEnabled(),
                'wrapper' => [
                    'class' => 'mb-0',
                ],
                'attr' => [
                    'data-bb-toggle' => 'collapse',
                    'data-bb-target' => '.tax-settings',
                ],
            ])
            ->add('open_fieldset_tax_settings', HtmlField::class, [
                'html' => sprintf(
                    '<fieldset class="form-fieldset mt-3 tax-settings" style="display: %s;" data-bb-value="1">',
                    EcommerceHelper::isTaxEnabled() ? 'block' : 'none'
                ),
            ])
            ->add('default_tax_rate', SelectField::class, [
                'label' => trans('plugins/ecommerce::setting.tax.form.default_tax_rate'),
                'selected' => get_ecommerce_setting('default_tax_rate'),
                'choices' => [0 => trans('plugins/ecommerce::setting.tax.form.select_tax')] +
                    app(Tax::class)->pluck('title', 'id')->all(),
                'help_block' => [
                    'text' => trans('plugins/ecommerce::setting.tax.form.default_tax_rate_description'),
                ],
            ])
            ->add(
                'display_product_price_including_taxes',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.tax.form.display_product_price_including_taxes'))
                    ->value(EcommerceHelper::isDisplayProductIncludingTaxes())
                    ->helperText(trans('plugins/ecommerce::setting.tax.form.display_product_price_including_taxes_helper'))
            )
            ->add(
                'display_tax_fields_at_checkout_page',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.tax.form.display_company_invoice_information_fields_at_checkout_page'))
                    ->value(EcommerceHelper::isDisplayTaxFieldsAtCheckoutPage())
                    ->helperText(trans('plugins/ecommerce::setting.tax.form.display_company_invoice_information_fields_at_checkout_page_helper'))
            )
            ->add(
                'display_checkout_tax_information',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/ecommerce::setting.tax.form.display_checkout_tax_information'))
                    ->value(EcommerceHelper::isDisplayCheckoutTaxInformation())
                    ->helperText(trans('plugins/ecommerce::setting.tax.form.display_checkout_tax_information_helper'))
            )
            ->add('display_tax_description', 'onOffCheckbox', [
                'label' => trans('plugins/ecommerce::setting.tax.display_tax_description'),
                'value' => get_ecommerce_setting('display_tax_description', false),
                'help_block' => [
                    'text' => trans('plugins/ecommerce::setting.tax.display_tax_description_help'),
                ],
            ])
            ->add('close_fieldset_tax_settings', 'html', [
                'html' => '</fieldset>',
            ]);
    }
}
