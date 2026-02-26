<?php

namespace App\Plugins\Payment\Http\Requests;

use App\Plugins\Payment\Enums\PaymentStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdatePaymentRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => Rule::in(PaymentStatusEnum::values()),
        ];
    }
}
