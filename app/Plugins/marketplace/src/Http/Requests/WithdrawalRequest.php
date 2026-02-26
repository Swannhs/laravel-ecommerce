<?php

namespace App\Plugins\Marketplace\Http\Requests;

use App\Plugins\Marketplace\Enums\PayoutPaymentMethodsEnum;
use App\Plugins\Marketplace\Enums\WithdrawalStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class WithdrawalRequest extends Request
{
    public function rules(): array
    {
        return [
            'images' => ['nullable', 'array'],
            'status' => Rule::in(WithdrawalStatusEnum::values()),
            'description' => ['nullable', 'max:400'],
            'payment_channel' => Rule::in(array_keys(PayoutPaymentMethodsEnum::payoutMethodsEnabled())),
        ];
    }
}
