<?php

namespace App\Plugins\Ecommerce\Http\Requests\Fronts;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Rules\EmailRule;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Core\Support\Http\Requests\Request;

class OrderTrackingRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'order_id' => ['nullable', 'string', 'min:1'],
            'email' => ['nullable', new EmailRule()],
        ];

        if (EcommerceHelper::isOrderTrackingUsingPhone()) {
            $rules['phone'] = ['nullable', ...BaseHelper::getPhoneValidationRule(true)];
        }

        return $rules;
    }
}
