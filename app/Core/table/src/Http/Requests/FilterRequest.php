<?php

namespace App\Core\Table\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class FilterRequest extends Request
{
    public function rules(): array
    {
        return [
            'key' => ['nullable', 'string'],
            'value' => ['nullable', 'string'],
            'class' => ['required', 'string'],
        ];
    }
}
