<?php

namespace App\Plugins\Ecommerce\Http\Middleware;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use Closure;
use Illuminate\Http\Request;

class CheckWishlistEnabledMiddleware
{
    public function handle(Request $request, Closure $closure)
    {
        abort_unless(EcommerceHelper::isWishlistEnabled(), 404);

        return $closure($request);
    }
}
