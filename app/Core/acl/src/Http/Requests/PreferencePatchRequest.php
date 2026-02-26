<?php

namespace App\Core\ACL\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class PreferencePatchRequest extends Request
{
    public function rules(): array
    {
        return [
            'minimal_sidebar' => ['sometimes', 'required', 'in:yes,no'],
        ];
    }
}
