<?php

namespace App\Core\ACL\Http\Requests;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Http\Requests\Concerns\HasPhoneFieldValidation;
use App\Core\Base\Rules\EmailRule;
use App\Core\Support\Http\Requests\Request;

class UpdateProfileRequest extends Request
{
    use HasPhoneFieldValidation;

    protected function prepareForValidation(): void
    {
        $this->preparePhoneForValidation();
    }

    public function rules(): array
    {
        return [
            'username' => ['required', 'string', 'alpha_dash', 'min:3', 'max:120'],
            'first_name' => ['required', 'string', 'max:60', 'min:2'],
            'last_name' => ['required', 'string', 'max:60', 'min:2'],
            'email' => ['required', 'max:120', 'min:6', new EmailRule()],
            'phone' => ['nullable', ...BaseHelper::getPhoneValidationRule(true)],
        ];
    }
}
