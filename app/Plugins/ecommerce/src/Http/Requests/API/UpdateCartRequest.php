<?php

namespace App\Plugins\Ecommerce\Http\Requests\API;

use App\Plugins\Ecommerce\Models\Product;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateCartRequest extends Request
{
    public function rules(): array
    {
        return [
            'product_id' => [
                'required',
                Rule::exists(Product::class, 'id'),
            ],
            'qty' => ['required', 'integer'],
        ];
    }

    public function messages(): array
    {
        return [
            'qty.required' => __('Quantity is required!'),
            'qty.integer' => __('Quantity must be a number!'),
        ];
    }

    public function bodyParameters(): array
    {
        return [
            'product_id' => [
                'description' => 'The ID of the product to update in the cart',
                'example' => 1,
            ],
            'qty' => [
                'description' => 'The new quantity of the product',
                'example' => 2,
            ],
        ];
    }
}
