<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Core\Support\Http\Requests\Request;

class CreateAddressFromAdminRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'is_default' => ['integer', 'min:0', 'max:1'],
            'customer_id' => ['required', 'exists:ec_customers,id'],
        ];

        if (! EcommerceHelper::isUsingInMultipleCountries()) {
            $this->merge(['country' => EcommerceHelper::getFirstCountryId()]);
        }

        return array_merge($rules, EcommerceHelper::getCustomerAddressValidationRules());
    }
}
