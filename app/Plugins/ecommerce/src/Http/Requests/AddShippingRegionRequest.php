<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class AddShippingRegionRequest extends Request
{
    public function rules(): array
    {
        return [
            'region' => ['nullable', 'string', Rule::in(array_keys(EcommerceHelper::getAvailableCountries()))],
        ];
    }
}
