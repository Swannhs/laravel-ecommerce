<?php

namespace App\Plugins\Ecommerce\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface ReviewInterface extends RepositoryInterface
{
    public function getGroupedByProductId(int|string $productId): Collection;
}
