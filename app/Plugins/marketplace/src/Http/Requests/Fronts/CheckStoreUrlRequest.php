<?php

namespace App\Plugins\Marketplace\Http\Requests\Fronts;

use App\Core\Support\Http\Requests\Request;

class CheckStoreUrlRequest extends Request
{
    public function rules(): array
    {
        return [
            'url' => ['required', 'max:200'],
        ];
    }
}
