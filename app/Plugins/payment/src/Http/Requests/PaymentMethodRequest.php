<?php

namespace App\Plugins\Payment\Http\Requests;

use App\Plugins\Payment\Enums\PaymentMethodEnum;
use App\Plugins\Payment\Supports\PaymentHelper;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PaymentMethodRequest extends Request
{
    protected function prepareForValidation(): void
    {
        $key = get_payment_setting_key('available_countries', $this->input('type'));

        $this->merge([
            $key => $this->input($key, []),
        ]);
    }

    public function rules(): array
    {
        return [
            'type' => ['required', 'string', 'max:120', Rule::in(PaymentMethodEnum::values())],
            ...PaymentHelper::getPaymentMethodRules($this->input('type')),
        ];
    }
}
