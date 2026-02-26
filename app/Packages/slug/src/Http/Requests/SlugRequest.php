<?php

namespace App\Packages\Slug\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class SlugRequest extends Request
{
    public function rules(): array
    {
        return [
            'value' => ['required', 'string'],
            'slug_id' => ['required', 'string'],
            'model' => ['nullable', 'string'],
        ];
    }
}
