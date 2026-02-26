<?php

namespace App\Plugins\Ecommerce\Http\Requests\API;

use App\Core\Support\Http\Requests\Request;

class DeleteWishlistRequest extends Request
{
    public function rules(): array
    {
        return [
            'product_id' => ['required', 'exists:ec_products,id'],
        ];
    }

    public function bodyParameters(): array
    {
        return [
            'product_id' => [
                'description' => 'The ID of the product to remove from the wishlist',
                'example' => 1,
            ],
        ];
    }
}
