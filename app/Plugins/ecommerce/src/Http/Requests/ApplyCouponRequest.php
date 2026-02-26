<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class ApplyCouponRequest extends Request
{
    public function rules(): array
    {
        return [
            'coupon_code' => ['required', 'string', 'max:255'],
        ];
    }
}
