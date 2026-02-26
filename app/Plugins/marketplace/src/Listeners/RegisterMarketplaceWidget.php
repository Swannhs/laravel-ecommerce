<?php

namespace App\Plugins\Marketplace\Listeners;

use App\Core\Base\Events\RenderingAdminWidgetEvent;
use App\Plugins\Marketplace\Widgets\AverageCommissionCard;
use App\Plugins\Marketplace\Widgets\ProductDistributionChart;
use App\Plugins\Marketplace\Widgets\RecentWithdrawalsTable;
use App\Plugins\Marketplace\Widgets\SaleCommissionHtml;
use App\Plugins\Marketplace\Widgets\StoreGrowthChart;
use App\Plugins\Marketplace\Widgets\StoreRevenueTable;
use App\Plugins\Marketplace\Widgets\TopPerformingStoresCard;
use App\Plugins\Marketplace\Widgets\WithdrawalStatusChart;

class RegisterMarketplaceWidget
{
    public function handle(RenderingAdminWidgetEvent $event): void
    {
        $event
            ->widget
            ->register([
                AverageCommissionCard::class,
                SaleCommissionHtml::class,
                StoreGrowthChart::class,
                ProductDistributionChart::class,
                TopPerformingStoresCard::class,
                WithdrawalStatusChart::class,
                StoreRevenueTable::class,
                RecentWithdrawalsTable::class,
            ], MARKETPLACE_MODULE_SCREEN_NAME);
    }
}
