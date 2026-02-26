<?php

namespace App\Plugins\Marketplace\Widgets;

use App\Core\Base\Widgets\Table;
use App\Plugins\Marketplace\Tables\StoreRevenueTable as BaseStoreRevenueTable;

class StoreRevenueTable extends Table
{
    protected string $table = BaseStoreRevenueTable::class;

    protected string $route = 'marketplace.reports.store-revenues';

    public function getLabel(): string
    {
        return trans('plugins/marketplace::marketplace.reports.store_revenues');
    }
}
