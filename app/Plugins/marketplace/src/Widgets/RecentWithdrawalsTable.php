<?php

namespace App\Plugins\Marketplace\Widgets;

use App\Core\Base\Widgets\Table;
use App\Plugins\Marketplace\Tables\RecentWithdrawalsTable as BaseRecentWithdrawalsTable;

class RecentWithdrawalsTable extends Table
{
    protected string $table = BaseRecentWithdrawalsTable::class;

    protected string $route = 'marketplace.reports.recent-withdrawals';

    public function getLabel(): string
    {
        return trans('plugins/marketplace::marketplace.reports.recent_withdrawals');
    }
}
