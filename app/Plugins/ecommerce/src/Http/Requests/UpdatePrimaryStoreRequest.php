<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class UpdatePrimaryStoreRequest extends Request
{
    public function rules(): array
    {
        return [
            'primary_store_id' => ['required', 'numeric'],
        ];
    }
}
