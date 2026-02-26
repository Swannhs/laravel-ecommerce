<?php

namespace App\Plugins\Ecommerce\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface ProductAttributeSetInterface extends RepositoryInterface
{
    public function getByProductId(int|array|string|null $productId): Collection;

    public function getAllWithSelected(int|array|string|null $productId, array $with = []): Collection;
}
