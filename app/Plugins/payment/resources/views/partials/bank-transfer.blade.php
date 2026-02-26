<x-plugins-payment::payment-method
    :name="\App\Plugins\Payment\Enums\PaymentMethodEnum::BANK_TRANSFER"
    :label="get_payment_setting('name', 'bank_transfer', trans('plugins/payment::payment.payment_via_bank_transfer'))"
/>
