<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Plugins\Ecommerce\Models\ProductCollection;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProductCollectionRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'name' => ['required', 'string', 'max:250'],
            'description' => ['nullable', 'string', 'max:400'],
            'collection_products' => ['nullable', 'string'],
        ];

        if ($this->route()->getName() === 'product-collections.create') {
            $rules = array_merge($rules, [
                'slug' => ['required', 'string', Rule::unique((new ProductCollection())->getTable(), 'slug')],
            ]);
        }

        return $rules;
    }
}
