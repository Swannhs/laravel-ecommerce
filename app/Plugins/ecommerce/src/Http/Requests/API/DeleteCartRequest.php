<?php

namespace App\Plugins\Ecommerce\Http\Requests\API;

use App\Plugins\Ecommerce\Models\Product;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class DeleteCartRequest extends Request
{
    public function rules(): array
    {
        return [
            'product_id' => [
                'required',
                Rule::exists(Product::class, 'id'),
            ],
        ];
    }

    public function bodyParameters(): array
    {
        return [
            'product_id' => [
                'description' => 'The ID of the product to remove from the cart',
                'example' => 1,
            ],
        ];
    }
}
