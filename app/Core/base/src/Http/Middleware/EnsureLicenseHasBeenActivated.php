<?php

namespace App\Core\Base\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

readonly class EnsureLicenseHasBeenActivated
{
    public function handle(Request $request, Closure $next)
    {
        if ($this->shouldBypass($request)) {
            return $next($request);
        }

        if (!$request->ajax() && !$request->wantsJson()) {
            if (!\App\Core\Base\Supports\Core::make()->verifyLicense(true)) {
                return redirect()->route('unlicensed');
            }
        }

        return $next($request);
    }

    protected function shouldBypass(Request $request): bool
    {
        if (app()->environment(['local', 'testing'])) {
            return true;
        }

        if (filter_var(env('BYPASS_LICENSE_VERIFICATION', false), FILTER_VALIDATE_BOOL)) {
            return true;
        }

        return $request->routeIs([
            'unlicensed',
            'unlicensed.*',
            'access.login',
            'access.login.post',
            'access.password.*',
            'install.*',
        ]);
    }
}
