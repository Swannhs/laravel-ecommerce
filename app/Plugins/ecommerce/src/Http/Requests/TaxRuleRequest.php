<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Tax;
use App\Plugins\Ecommerce\Models\TaxRule;
use App\Plugins\Location\Rules\CityRule;
use App\Plugins\Location\Rules\StateRule;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class TaxRuleRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'tax_id' => Rule::exists(Tax::class, 'id'),
            'country' => [Rule::in(array_keys(EcommerceHelper::getAvailableCountries()))],
            'state' => ['nullable'],
            'city' => ['nullable'],
            'percentage' => ['required', 'numeric', 'between:0,99.99'],
        ];

        if (EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
            $rules['state'] = ['nullable', new StateRule('country')];

            if (EcommerceHelper::useCityFieldAsTextField()) {
                $rules['city'] = [
                    'nullable',
                    'string',
                    'max:120',
                ];
            } else {
                $rules['city'] = ['nullable', new CityRule('state')];
            }
        }

        if (EcommerceHelper::isZipCodeEnabled()) {
            $rules['zip_code'] = [
                'nullable',
                ...BaseHelper::getZipcodeValidationRule(true),
                Rule::unique(TaxRule::class, 'zip_code')->ignore($this->route('rule.id')),
            ];
        }

        return $rules;
    }
}
