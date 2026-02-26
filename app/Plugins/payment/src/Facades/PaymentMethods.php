<?php

namespace App\Plugins\Payment\Facades;

use App\Plugins\Payment\Supports\PaymentMethods as PaymentMethodsSupport;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \App\Plugins\Payment\Supports\PaymentMethods method(string $name, array $args = [])
 * @method static array methods()
 * @method static \App\Plugins\Payment\Supports\PaymentMethods removeMethod(string $name)
 * @method static \App\Plugins\Payment\Supports\PaymentMethods excludeMethod(string $name)
 * @method static \App\Plugins\Payment\Supports\PaymentMethods includeMethod(string $name)
 * @method static array getExcludedMethods()
 * @method static bool isMethodExcluded(string $name)
 * @method static \App\Plugins\Payment\Supports\PaymentMethods clearExcludedMethods()
 * @method static string|null getDefaultMethod()
 * @method static string|null getSelectedMethod()
 * @method static string|null getSelectingMethod()
 * @method static \App\Plugins\Payment\Supports\PaymentMethods setSelectingMethod(?string $method)
 * @method static string render()
 *
 * @see \App\Plugins\Payment\Supports\PaymentMethods
 */
class PaymentMethods extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return PaymentMethodsSupport::class;
    }
}
