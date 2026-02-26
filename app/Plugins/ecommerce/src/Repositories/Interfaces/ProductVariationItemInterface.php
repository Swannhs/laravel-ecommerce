<?php

namespace App\Plugins\Ecommerce\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;

interface ProductVariationItemInterface extends RepositoryInterface
{
    public function getVariationsInfo(array $versionIds);

    public function getProductAttributes($productId);
}
