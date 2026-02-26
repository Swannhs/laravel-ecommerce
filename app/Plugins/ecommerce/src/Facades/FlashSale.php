<?php

namespace App\Plugins\Ecommerce\Facades;

use App\Plugins\Ecommerce\Supports\FlashSaleSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \App\Plugins\Ecommerce\Models\Product|null flashSaleForProduct(\App\Plugins\Ecommerce\Models\Product $product)
 * @method static \App\Plugins\Ecommerce\Models\FlashSale|null getFlashSaleForProduct(\App\Plugins\Ecommerce\Models\Product $product)
 * @method static \Illuminate\Support\Collection getAvailableFlashSales()
 * @method static bool isEnabled()
 * @method static bool isShowSaleCountLeft()
 * @method static void addShowSaleCountLeftSetting()
 *
 * @see \App\Plugins\Ecommerce\Supports\FlashSaleSupport
 */
class FlashSale extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return FlashSaleSupport::class;
    }
}
