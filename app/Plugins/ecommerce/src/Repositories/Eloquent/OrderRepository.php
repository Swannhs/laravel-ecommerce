<?php

namespace App\Plugins\Ecommerce\Repositories\Eloquent;

use App\Plugins\Ecommerce\Models\Order;
use App\Plugins\Ecommerce\Repositories\Interfaces\OrderInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use Carbon\CarbonInterface;
use Illuminate\Database\Eloquent\Collection;

class OrderRepository extends RepositoriesAbstract implements OrderInterface
{
    public function getRevenueData(CarbonInterface $startDate, CarbonInterface $endDate, $select = []): Collection
    {
        return Order::getRevenueData($startDate, $endDate);
    }

    public function countRevenueByDateRange(CarbonInterface $startDate, CarbonInterface $endDate): float
    {
        return Order::countRevenueByDateRange($startDate, $endDate);
    }
}
