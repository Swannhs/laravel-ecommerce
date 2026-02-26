<?php

namespace App\Plugins\LanguageAdvanced\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class LanguageAdvancedRequest extends Request
{
    public function rules(): array
    {
        return [
            'model' => ['required', 'string', 'max:255'],
        ];
    }
}
