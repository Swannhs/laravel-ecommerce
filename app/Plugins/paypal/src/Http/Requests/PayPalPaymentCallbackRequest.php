<?php

namespace App\Plugins\PayPal\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class PayPalPaymentCallbackRequest extends Request
{
    public function rules(): array
    {
        return [
            'amount' => ['required', 'numeric'],
            'currency' => ['required'],
        ];
    }
}
