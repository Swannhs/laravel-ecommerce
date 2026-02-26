<?php

namespace App\Plugins\Ecommerce\Http\Middleware;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use Closure;
use Illuminate\Http\Request;

class CheckProductSpecificationEnabledMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        abort_unless(EcommerceHelper::isProductSpecificationEnabled(), 404);

        return $next($request);
    }
}
