<?php

namespace App\Plugins\Marketplace\Http\Requests;

use App\Plugins\Marketplace\Enums\PayoutPaymentMethodsEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Support\Arr;

class PayoutInformationSettingRequest extends Request
{
    protected function prepareForValidation(): void
    {
        $channel = $this->input('payout_payment_method');

        $this->merge(['bank_info' => [$channel => Arr::get($this->input('bank_info'), $channel)]]);
    }

    public function rules(): array
    {
        return PayoutPaymentMethodsEnum::getRules('bank_info');
    }

    public function attributes(): array
    {
        return array_merge([
            'bank_info' => trans('plugins/marketplace::withdrawal.payout_info'),
        ], PayoutPaymentMethodsEnum::getAttributes('bank_info'));
    }

    protected function passedValidation(): void
    {
        $channel = $this->input('payout_payment_method');

        $this->merge(['bank_info' => Arr::get($this->input('bank_info'), $channel)]);
    }
}
