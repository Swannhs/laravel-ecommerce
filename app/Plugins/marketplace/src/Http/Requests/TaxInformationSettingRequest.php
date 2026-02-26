<?php

namespace App\Plugins\Marketplace\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class TaxInformationSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'tax_info.*' => ['nullable', 'array'],
            'tax_info.business_name' => ['nullable', 'string', 'max:255'],
            'tax_info.tax_id' => ['nullable', 'string', 'max:255'],
            'tax_info.address' => ['nullable', 'string', 'max:255'],
        ];
    }
}
