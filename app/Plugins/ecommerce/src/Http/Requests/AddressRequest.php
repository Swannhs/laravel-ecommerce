<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Http\Requests\Concerns\HasPhoneFieldValidation;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Core\Support\Http\Requests\Request;

class AddressRequest extends Request
{
    use HasPhoneFieldValidation;

    protected function prepareForValidation(): void
    {
        $this->preparePhoneForValidation();

        if (! EcommerceHelper::isUsingInMultipleCountries()) {
            $this->merge(['country' => EcommerceHelper::getFirstCountryId()]);
        }
    }

    public function rules(): array
    {
        $rules = [
            'is_default' => ['sometimes', 'boolean'],
        ];

        return array_merge($rules, EcommerceHelper::getCustomerAddressValidationRules());
    }
}
