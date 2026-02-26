<?php

namespace App\Plugins\Language\Http\Middleware;

use App\Plugins\Language\Facades\Language;
use Closure;
use Illuminate\Http\Request;

class LocalizationRoutes extends LaravelLocalizationMiddlewareBase
{
    public function handle(Request $request, Closure $next)
    {
        if ($this->shouldIgnore($request)) {
            return $next($request);
        }

        $routeName = Language::getRouteNameFromAPath($request->getUri());

        Language::setRouteName($routeName);

        return $next($request);
    }
}
