<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class SearchProductAndVariationsRequest extends Request
{
    public function rules(): array
    {
        return [
            'product_ids' => ['sometimes', 'array'],
            'keyword' => ['nullable', 'string', 'max:220'],
        ];
    }
}
