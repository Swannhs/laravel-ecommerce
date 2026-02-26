<?php

namespace App\Plugins\Ecommerce\Repositories\Eloquent;

use App\Plugins\Ecommerce\Models\GroupedProduct;
use App\Plugins\Ecommerce\Repositories\Interfaces\GroupedProductInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;

class GroupedProductRepository extends RepositoriesAbstract implements GroupedProductInterface
{
    public function getChildren($groupedProductId, array $params)
    {
        return GroupedProduct::getChildren($groupedProductId);
    }

    public function createGroupedProducts($groupedProductId, array $childItems): void
    {
        GroupedProduct::createGroupedProducts($groupedProductId, $childItems);
    }
}
