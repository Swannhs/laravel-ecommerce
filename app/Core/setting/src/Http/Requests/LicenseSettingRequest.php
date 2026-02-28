<?php

namespace App\Core\Setting\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class LicenseSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'purchase_code' => ['required', 'string'],
            'buyer' => ['required', 'string'],
            'license_rules_agreement' => ['accepted:1'],
        ];
    }

    public function messages(): array
    {
        return [
            'license_rules_agreement.accepted' => 'Please agree to the license terms by clicking on the checkbox.',
        ];
    }
}
