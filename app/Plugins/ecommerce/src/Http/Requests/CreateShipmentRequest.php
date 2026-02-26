<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class CreateShipmentRequest extends Request
{
    public function rules(): array
    {
        return [
            'method' => ['required', 'string'],
            'store_id' => ['nullable', 'exists:ec_store_locators,id'],
        ];
    }
}
