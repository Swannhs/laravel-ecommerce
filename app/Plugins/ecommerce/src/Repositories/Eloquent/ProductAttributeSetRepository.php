<?php

namespace App\Plugins\Ecommerce\Repositories\Eloquent;

use App\Plugins\Ecommerce\Models\ProductAttributeSet;
use App\Plugins\Ecommerce\Repositories\Interfaces\ProductAttributeSetInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class ProductAttributeSetRepository extends RepositoriesAbstract implements ProductAttributeSetInterface
{
    public function getByProductId(int|array|string|null $productId): Collection
    {
        return ProductAttributeSet::getByProductId($productId);
    }

    public function getAllWithSelected(int|array|string|null $productId, array $with = []): Collection
    {
        return ProductAttributeSet::getAllWithSelected($productId, $with);
    }
}
