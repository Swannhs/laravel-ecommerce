<?php

namespace App\Plugins\Ecommerce\Http\Middleware;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use Closure;
use Illuminate\Http\Request;

class CheckCompareEnabledMiddleware
{
    public function handle(Request $request, Closure $closure)
    {
        abort_unless(EcommerceHelper::isCompareEnabled(), 404);

        return $closure($request);
    }
}
