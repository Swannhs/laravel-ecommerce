<?php

namespace App\Plugins\Payment\Http\Requests\Settings;

use App\Plugins\Payment\Enums\PaymentMethodEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PaymentMethodSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'default_payment_method' => ['required', Rule::in(PaymentMethodEnum::values())],
        ];
    }
}
