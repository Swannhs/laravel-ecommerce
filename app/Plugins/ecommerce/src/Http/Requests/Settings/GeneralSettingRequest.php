<?php

namespace App\Plugins\Ecommerce\Http\Requests\Settings;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Rules\EmailRule;
use App\Core\Support\Http\Requests\Request;

class GeneralSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'store_name' => ['required', 'string', 'max:120'],
            'store_company' => ['nullable', 'string', 'max:120'],
            'store_phone' => 'nullable|' . BaseHelper::getPhoneValidationRule(),
            'store_email' => ['nullable', new EmailRule()],
            'store_address' => ['nullable', 'string', 'max:255'],
            'store_country' => ['nullable', 'string', 'max:120'],
            'store_state' => ['nullable', 'string', 'max:120'],
            'store_city' => ['nullable', 'string', 'max:120'],
            'store_vat_number' => ['nullable', 'string', 'max:120'],
            'store_zip_code' => ['nullable', ...BaseHelper::getZipcodeValidationRule(true)],
            'admin_notification_email' => ['nullable', 'array'],
        ];
    }
}
