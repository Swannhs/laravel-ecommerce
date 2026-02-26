<?php

namespace App\Plugins\Ecommerce\Http\Resources\API;

use App\Plugins\Ecommerce\Models\Product;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Product
 */
class ProductCartResource extends JsonResource
{
    public function toArray($request): array
    {
        $price = $this->price();

        return [
            'id' => $this->id,
            'slug' => $this->slug,
            'name' => $this->name,
            'quantity' => $this->quantity,
            'is_out_of_stock' => $this->isOutOfStock(),
            'price' => $price->getPrice(),
            'price_formatted' => $price->displayAsText(),
        ];
    }
}
