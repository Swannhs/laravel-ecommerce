<?php

namespace App\Plugins\Razorpay\Forms;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Plugins\Payment\Concerns\Forms\HasAvailableCountriesField;
use App\Plugins\Payment\Forms\PaymentMethodForm;

class RazorpayPaymentMethodForm extends PaymentMethodForm
{
    use HasAvailableCountriesField;

    public function setup(): void
    {
        parent::setup();

        $this
            ->paymentId(RAZORPAY_PAYMENT_METHOD_NAME)
            ->paymentName('Razorpay')
            ->paymentDescription(trans('plugins/razorpay::razorpay.payment_description', ['name' => 'Razorpay']))
            ->paymentLogo(url('vendor/core/plugins/razorpay/images/razorpay.svg'))
            ->paymentFeeField(RAZORPAY_PAYMENT_METHOD_NAME)
            ->paymentUrl('https://razorpay.com')
            ->paymentInstructions(view('plugins/razorpay::instructions')->render())
            ->add(
                sprintf('payment_%s_key', RAZORPAY_PAYMENT_METHOD_NAME),
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/razorpay::razorpay.key'))
                    ->value(BaseHelper::hasDemoModeEnabled() ? '*******************************' : get_payment_setting('key', RAZORPAY_PAYMENT_METHOD_NAME))
            )
            ->add(
                sprintf('payment_%s_secret', RAZORPAY_PAYMENT_METHOD_NAME),
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/razorpay::razorpay.secret'))
                    ->value(BaseHelper::hasDemoModeEnabled() ? '*******************************' : get_payment_setting('secret', RAZORPAY_PAYMENT_METHOD_NAME))
            )
            ->add(
                'payment_' . RAZORPAY_PAYMENT_METHOD_NAME . '_payment_type',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/razorpay::razorpay.payment_type'))
                    ->choices([
                        'hosted_checkout' => 'Hosted Checkout',
                        'website_embedded' => 'Website Embedded',
                    ])
                    ->selected(get_payment_setting(
                        'payment_type',
                        RAZORPAY_PAYMENT_METHOD_NAME,
                        'hosted_checkout',
                    ))
            )
            ->add(
                sprintf('payment_%s_webhook_secret', RAZORPAY_PAYMENT_METHOD_NAME),
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/razorpay::razorpay.webhook_secret'))
                    ->helperText(trans('plugins/razorpay::razorpay.webhook_secret_helper'))
                    ->value(BaseHelper::hasDemoModeEnabled() ? '*******************************' : get_payment_setting('webhook_secret', RAZORPAY_PAYMENT_METHOD_NAME))
            )
            ->addAvailableCountriesField(RAZORPAY_PAYMENT_METHOD_NAME);
    }
}
