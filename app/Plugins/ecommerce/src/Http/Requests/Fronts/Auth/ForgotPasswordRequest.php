<?php

namespace App\Plugins\Ecommerce\Http\Requests\Fronts\Auth;

use App\Core\Base\Rules\EmailRule;
use App\Core\Support\Http\Requests\Request;

class ForgotPasswordRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => ['required', new EmailRule()],
        ];
    }
}
