<?php

namespace App\Plugins\Ecommerce\Http\Requests\Fronts;

use App\Core\Support\Http\Requests\Request;

class AccountDeletionRequest extends Request
{
    public function rules(): array
    {
        return [
            'password' => ['required', 'string', 'current_password:customer'],
            'reason' => ['nullable', 'string', 'max:255'],
        ];
    }
}
