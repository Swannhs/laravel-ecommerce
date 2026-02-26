<?php

namespace App\Plugins\Location\Http\Requests;

use App\Plugins\Location\Facades\Location;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ImportLocationRequest extends Request
{
    public function rules(): array
    {
        return [
            'country_code' => ['required', 'string', Rule::in(array_keys(Location::getAvailableCountries()))],
            'continue' => ['required', 'boolean'],
        ];
    }
}
