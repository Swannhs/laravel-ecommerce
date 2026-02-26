<?php

namespace App\Plugins\Ecommerce\Repositories\Eloquent;

use App\Plugins\Ecommerce\Models\ProductVariationItem;
use App\Plugins\Ecommerce\Repositories\Interfaces\ProductVariationItemInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;

class ProductVariationItemRepository extends RepositoriesAbstract implements ProductVariationItemInterface
{
    public function getVariationsInfo(array $versionIds)
    {
        return ProductVariationItem::getVariationsInfo($versionIds);
    }

    public function getProductAttributes($productId)
    {
        return ProductVariationItem::getProductAttributes($productId);
    }
}
