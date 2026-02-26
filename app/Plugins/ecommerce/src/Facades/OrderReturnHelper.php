<?php

namespace App\Plugins\Ecommerce\Facades;

use App\Plugins\Ecommerce\Supports\OrderReturnHelper as BaseOrderReturnHelper;
use Illuminate\Support\Facades\Facade;

/**
 * @method static array returnOrder(\App\Plugins\Ecommerce\Models\Order $order, array $data)
 * @method static array cancelReturnOrder(\App\Plugins\Ecommerce\Models\OrderReturn $orderReturn, string|null $reason = null)
 * @method static array updateReturnOrder(\App\Plugins\Ecommerce\Models\OrderReturn $orderReturn, array $data)
 *
 * @see \App\Plugins\Ecommerce\Supports\OrderReturnHelper
 */
class OrderReturnHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return BaseOrderReturnHelper::class;
    }
}
