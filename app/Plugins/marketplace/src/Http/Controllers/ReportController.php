<?php

namespace App\Plugins\Marketplace\Http\Controllers;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Widgets\Contracts\AdminWidget;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Marketplace\Tables\RecentWithdrawalsTable;
use App\Plugins\Marketplace\Tables\StoreRevenueTable;
use Illuminate\Http\Request;

class ReportController extends BaseController
{
    public function index(
        Request $request,
        AdminWidget $widget
    ) {
        $this->pageTitle(trans('plugins/marketplace::marketplace.reports.name'));

        Assets::usingVueJS()
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/libraries/daterangepicker/daterangepicker.js',
                'vendor/core/plugins/ecommerce/js/report.js',
            ])
            ->addStylesDirectly([
                'vendor/core/plugins/ecommerce/libraries/daterangepicker/daterangepicker.css',
                'vendor/core/plugins/ecommerce/css/report.css',
            ])
            ->addScripts(['moment', 'apexchart'])
            ->addStyles(['apexchart']);

        [$startDate, $endDate] = EcommerceHelper::getDateRangeInReport($request);

        if ($request->ajax()) {
            return $this
                ->httpResponse()
                ->setData($widget->render(MARKETPLACE_MODULE_SCREEN_NAME));
        }

        return view(
            'plugins/marketplace::reports.index',
            compact('startDate', 'endDate', 'widget')
        );
    }

    public function getStoreRevenues(StoreRevenueTable $storeRevenueTable)
    {
        return $storeRevenueTable->renderTable();
    }

    public function getRecentWithdrawals(RecentWithdrawalsTable $recentWithdrawalsTable)
    {
        return $recentWithdrawalsTable->renderTable();
    }
}
