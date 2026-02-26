<?php

namespace App\Packages\Shortcode\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class RenderBlockUiRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string'],
            'attributes' => ['nullable', 'array'],
            'attributes.*' => ['nullable', 'string'],
        ];
    }
}
