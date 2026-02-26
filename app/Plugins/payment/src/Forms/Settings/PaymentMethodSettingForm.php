<?php

namespace App\Plugins\Payment\Forms\Settings;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\Fields\SelectField;
use App\Plugins\Payment\Enums\PaymentMethodEnum;
use App\Plugins\Payment\Http\Requests\Settings\PaymentMethodSettingRequest;
use App\Plugins\Payment\Supports\PaymentHelper;
use App\Core\Setting\Forms\SettingForm;

class PaymentMethodSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        Assets::addStylesDirectly('vendor/core/plugins/payment/css/payment-setting.css');

        $this
            ->contentOnly()
            ->setSectionTitle(trans('plugins/payment::payment.payment_methods'))
            ->setSectionDescription(trans('plugins/payment::payment.payment_methods_description'))
            ->setValidatorClass(PaymentMethodSettingRequest::class)
            ->setUrl(route('payments.settings'))
            ->add(
                'default_payment_method',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/payment::payment.default_payment_method'))
                    ->choices(PaymentMethodEnum::labels())
                    ->selected(PaymentHelper::defaultPaymentMethod()),
            );
    }
}
