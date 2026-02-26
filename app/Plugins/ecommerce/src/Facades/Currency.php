<?php

namespace App\Plugins\Ecommerce\Facades;

use App\Plugins\Ecommerce\Supports\CurrencySupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static void setApplicationCurrency(\App\Plugins\Ecommerce\Models\Currency $currency)
 * @method static \App\Plugins\Ecommerce\Models\Currency|null getApplicationCurrency()
 * @method static \App\Plugins\Ecommerce\Models\Currency|null getDefaultCurrency()
 * @method static \Illuminate\Support\Collection currencies()
 * @method static string|null detectedCurrencyCode()
 * @method static array countryCurrencies()
 * @method static array currencyCodes()
 *
 * @see \App\Plugins\Ecommerce\Supports\CurrencySupport
 */
class Currency extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return CurrencySupport::class;
    }
}
