<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Plugins\Payment\Enums\PaymentMethodEnum;
use App\Plugins\Payment\Enums\PaymentStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class MarkOrderAsCompletedRequest extends Request
{
    public function rules(): array
    {
        if (! is_plugin_active('payment')) {
            return [];
        }

        return [
            'payment_method' => ['required', 'string', Rule::in(PaymentMethodEnum::values())],
            'payment_status' => ['required', 'string', Rule::in(PaymentStatusEnum::values())],
            'transaction_id' => [Rule::when(
                in_array(
                    $this->input('payment_method'),
                    [PaymentMethodEnum::COD, PaymentMethodEnum::BANK_TRANSFER]
                ),
                'nullable',
                'required'
            )],
        ];
    }
}
