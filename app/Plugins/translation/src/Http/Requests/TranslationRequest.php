<?php

namespace App\Plugins\Translation\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class TranslationRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:250'],
        ];
    }
}
