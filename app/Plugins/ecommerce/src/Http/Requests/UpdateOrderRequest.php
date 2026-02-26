<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class UpdateOrderRequest extends Request
{
    public function rules(): array
    {
        return [
            'description' => ['nullable', 'string', 'max:400'],
            'private_notes' => ['nullable', 'string', 'max:1000'],
        ];
    }
}
