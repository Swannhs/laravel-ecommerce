<?php

namespace App\Plugins\Stripe\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class StripePaymentCallbackRequest extends Request
{
    public function rules(): array
    {
        return [
            'session_id' => ['required', 'size:66'],
        ];
    }
}
