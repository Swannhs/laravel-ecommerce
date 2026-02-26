<?php

namespace App\Plugins\Analytics\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class AnalyticsRequest extends Request
{
    public function rules(): array
    {
        return [
            'predefined_range' => ['nullable', 'string'],
            'changed_predefined_range' => ['nullable', 'boolean'],
        ];
    }
}
