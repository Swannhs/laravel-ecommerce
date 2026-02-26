<?php

namespace App\Plugins\Ecommerce\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Carbon\CarbonInterface;
use Illuminate\Database\Eloquent\Collection;

interface OrderInterface extends RepositoryInterface
{
    public function getRevenueData(CarbonInterface $startDate, CarbonInterface $endDate, array $select = []): Collection;

    public function countRevenueByDateRange(CarbonInterface $startDate, CarbonInterface $endDate): float;
}
