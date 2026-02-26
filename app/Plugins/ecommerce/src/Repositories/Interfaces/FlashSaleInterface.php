<?php

namespace App\Plugins\Ecommerce\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface FlashSaleInterface extends RepositoryInterface
{
    public function getAvailableFlashSales(array $with = []): Collection;
}
