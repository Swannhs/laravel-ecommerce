<?php

namespace App\Plugins\Ecommerce\Http\Requests\Fronts\Auth;

use App\Core\Base\Rules\EmailRule;
use App\Core\Support\Http\Requests\Request;

class ResetPasswordRequest extends Request
{
    public function rules(): array
    {
        return [
            'token' => ['required', 'string'],
            'email' => ['required', new EmailRule()],
            'password' => ['required', 'confirmed', 'min:6'],
        ];
    }
}
