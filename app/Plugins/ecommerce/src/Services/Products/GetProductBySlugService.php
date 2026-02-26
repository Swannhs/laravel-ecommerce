<?php

namespace App\Plugins\Ecommerce\Services\Products;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Plugins\Ecommerce\Models\Product;
use App\Packages\Slug\Facades\SlugHelper;

class GetProductBySlugService
{
    public function handle(string $slug, array $params = []): ?Product
    {
        $slug = SlugHelper::getSlug($slug, model: Product::class);

        if (! $slug) {
            return null;
        }

        $condition = [
            'ec_products.id' => $slug->reference_id,
            'ec_products.status' => BaseStatusEnum::PUBLISHED,
        ];

        return get_products(
            [
                'condition' => $condition,
                'take' => 1,
                ...$params,
            ]
        );
    }
}
