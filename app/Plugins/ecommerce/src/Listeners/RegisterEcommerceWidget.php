<?php

namespace App\Plugins\Ecommerce\Listeners;

use App\Core\Base\Events\RenderingAdminWidgetEvent;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Widgets\AverageOrderValueCard;
use App\Plugins\Ecommerce\Widgets\ConversionRateCard;
use App\Plugins\Ecommerce\Widgets\CustomerChart;
use App\Plugins\Ecommerce\Widgets\CustomerRetentionChart;
use App\Plugins\Ecommerce\Widgets\ExpensesCard;
use App\Plugins\Ecommerce\Widgets\NewCustomerCard;
use App\Plugins\Ecommerce\Widgets\NewOrderCard;
use App\Plugins\Ecommerce\Widgets\NewProductCard;
use App\Plugins\Ecommerce\Widgets\OrderChart;
use App\Plugins\Ecommerce\Widgets\OrderStatusDistributionChart;
use App\Plugins\Ecommerce\Widgets\PaymentMethodDistributionChart;
use App\Plugins\Ecommerce\Widgets\ProductCategoryDistributionChart;
use App\Plugins\Ecommerce\Widgets\ProductReviewsSummaryCard;
use App\Plugins\Ecommerce\Widgets\ProfitCard;
use App\Plugins\Ecommerce\Widgets\RecentOrdersTable;
use App\Plugins\Ecommerce\Widgets\ReportGeneralHtml;
use App\Plugins\Ecommerce\Widgets\RevenueCard;
use App\Plugins\Ecommerce\Widgets\ShippingMethodUsageChart;
use App\Plugins\Ecommerce\Widgets\TaxCollectionSummaryCard;
use App\Plugins\Ecommerce\Widgets\TopSellingProductsTable;
use App\Plugins\Ecommerce\Widgets\TrendingProductsTable;
use Illuminate\Support\Facades\Auth;

class RegisterEcommerceWidget
{
    public function handle(RenderingAdminWidgetEvent $event): void
    {
        $allWidgets = [
            // Financial Metrics (Top Row)
            RevenueCard::class,
            ProfitCard::class,
            ExpensesCard::class,
            AverageOrderValueCard::class,

            // Activity Metrics (Second Row)
            NewOrderCard::class,
            NewCustomerCard::class,
            NewProductCard::class,
            ConversionRateCard::class,

            // Additional Metrics (Third Row)
            ...EcommerceHelper::isTaxEnabled() ? [TaxCollectionSummaryCard::class] : [],
            ProductReviewsSummaryCard::class,

            // Detailed Analytics (Full Width)
            ReportGeneralHtml::class,

            // Performance Charts (Two Columns Each)
            CustomerChart::class,
            OrderChart::class,
            CustomerRetentionChart::class,

            // Distribution Charts (Two Columns Each)
            ProductCategoryDistributionChart::class,
            OrderStatusDistributionChart::class,
            PaymentMethodDistributionChart::class,
            ShippingMethodUsageChart::class,

            // Data Tables (Two Columns Each)
            RecentOrdersTable::class,
            TopSellingProductsTable::class,
            TrendingProductsTable::class,
        ];

        // Filter widgets based on user preferences
        $enabledWidgets = $this->getEnabledWidgets($allWidgets);

        $event->widget->register($enabledWidgets, 'ecommerce');
    }

    protected function getEnabledWidgets(array $allWidgets): array
    {
        if (! Auth::check()) {
            return $allWidgets;
        }

        $userId = Auth::id();
        $settingKey = "ecommerce_report_widgets_user_{$userId}";

        $userPreferences = setting($settingKey);

        if (is_string($userPreferences)) {
            $userPreferences = json_decode($userPreferences, true) ?: [];
        }

        if (empty($userPreferences)) {
            return $allWidgets;
        }

        return array_filter($allWidgets, function ($widget) use ($userPreferences) {
            return in_array($widget, $userPreferences);
        });
    }
}
