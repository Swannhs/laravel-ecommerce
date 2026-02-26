<?php

namespace App\Plugins\Ecommerce\Http\Requests\API;

use App\Plugins\Ecommerce\Models\Product;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class AddCartRequest extends Request
{
    public function rules(): array
    {
        return [
            'product_id' => [
                'required',
                Rule::exists(Product::class, 'id'),
            ],
            'qty' => [
                'required_with:product_id',
                'integer',
                'min:1',
            ],
        ];
    }

    public function bodyParameters(): array
    {
        return [
            'product_id' => [
                'description' => 'The ID of the product to add to the cart',
                'example' => 1,
            ],
            'qty' => [
                'description' => 'The quantity of the product to add',
                'example' => 1,
            ],
        ];
    }
}
