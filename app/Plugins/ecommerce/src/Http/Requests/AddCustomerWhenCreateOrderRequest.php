<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Rules\EmailRule;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Customer;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class AddCustomerWhenCreateOrderRequest extends Request
{
    public function rules(): array
    {
        if (! EcommerceHelper::isUsingInMultipleCountries()) {
            $this->merge(['country' => EcommerceHelper::getFirstCountryId()]);
        }

        $rules = EcommerceHelper::getCustomerAddressValidationRules();

        $rules['email'] = ['nullable', new EmailRule(), Rule::unique((new Customer())->getTable(), 'email')];

        return $rules;
    }
}
