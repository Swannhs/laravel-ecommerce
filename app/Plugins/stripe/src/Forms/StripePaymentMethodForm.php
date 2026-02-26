<?php

namespace App\Plugins\Stripe\Forms;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Plugins\Payment\Concerns\Forms\HasAvailableCountriesField;
use App\Plugins\Payment\Forms\PaymentMethodForm;

class StripePaymentMethodForm extends PaymentMethodForm
{
    use HasAvailableCountriesField;

    public function setup(): void
    {
        parent::setup();

        $this
            ->paymentId(STRIPE_PAYMENT_METHOD_NAME)
            ->paymentName('Stripe')
            ->paymentDescription(trans('plugins/payment::payment.stripe_description'))
            ->paymentLogo(url('vendor/core/plugins/stripe/images/stripe.svg'))
            ->paymentFeeField(STRIPE_PAYMENT_METHOD_NAME)
            ->paymentUrl('https://stripe.com')
            ->paymentInstructions(view('plugins/stripe::instructions')->render())
            ->add(
                'payment_stripe_client_id',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/payment::payment.stripe_key'))
                    ->value(BaseHelper::hasDemoModeEnabled() ? '*******************************' : get_payment_setting('client_id', 'stripe'))
                    ->placeholder('pk_*************')
                    ->attributes(['data-counter' => 400])
            )
            ->add(
                'payment_stripe_secret',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/payment::payment.stripe_secret'))
                    ->value(BaseHelper::hasDemoModeEnabled() ? '*******************************' : get_payment_setting('secret', 'stripe'))
                    ->placeholder('sk_*************')
            )
            ->add(
                'payment_' . STRIPE_PAYMENT_METHOD_NAME . '_payment_type',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/stripe::stripe.payment_type'))
                    ->choices([
                        'stripe_api_charge' => 'Stripe API Charge',
                        'stripe_checkout' => 'Stripe Checkout',
                    ])
                    ->selected(get_payment_setting(
                        'payment_type',
                        STRIPE_PAYMENT_METHOD_NAME,
                        'stripe_api_charge',
                    ))
            )
            ->add(
                'payment_stripe_webhook_secret',
                'password',
                TextFieldOption::make()
                    ->label(trans('plugins/stripe::stripe.webhook_secret'))
                    ->value(BaseHelper::hasDemoModeEnabled() ? '*******************************' : get_payment_setting('webhook_secret', 'stripe'))
                    ->placeholder('whsec_*************')
            )
            ->addAvailableCountriesField(STRIPE_PAYMENT_METHOD_NAME);
    }
}
