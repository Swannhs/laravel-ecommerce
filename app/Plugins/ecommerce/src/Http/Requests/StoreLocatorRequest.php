<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Rules\EmailRule;
use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class StoreLocatorRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:120'],
            'email' => ['nullable', new EmailRule()],
            'phone' => ['required', ...BaseHelper::getPhoneValidationRule(true)],
            'country' => ['required', 'string', 'max:120'],
            'state' => ['required', 'string', 'max:120'],
            'city' => ['required', 'string', 'max:120'],
            'address' => ['required', 'string', 'max:120'],
            'zip_code' => ['nullable', ...BaseHelper::getZipcodeValidationRule(true)],
            'is_shipping_location' => [new OnOffRule()],
        ];
    }
}
