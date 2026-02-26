<?php

namespace App\Packages\Optimize\Facades;

use App\Packages\Optimize\Supports\Optimizer;
use Illuminate\Support\Facades\Facade;

/**
 * @method static bool isEnabled()
 * @method static \App\Packages\Optimize\Supports\Optimizer enable()
 * @method static \App\Packages\Optimize\Supports\Optimizer disable()
 *
 * @see \App\Packages\Optimize\Supports\Optimizer
 */
class OptimizerHelper extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return Optimizer::class;
    }
}
