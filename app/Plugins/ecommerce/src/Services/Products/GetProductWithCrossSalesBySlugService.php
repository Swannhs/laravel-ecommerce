<?php

namespace App\Plugins\Ecommerce\Services\Products;

use App\Plugins\Ecommerce\Models\Product;

class GetProductWithCrossSalesBySlugService
{
    public function __construct(protected GetProductBySlugService $getProductBySlugService)
    {
    }

    public function handle(string $slug, array $params = []): ?Product
    {
        return $this->getProductBySlugService->handle($slug, [
            ...$params,
            ...[
                'with' => [
                    'crossSales',
                ],
            ],
        ]);
    }
}
