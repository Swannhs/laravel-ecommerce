<?php

namespace App\Core\Base\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

readonly class EnsureLicenseHasBeenActivated
{
    public function handle(Request $request, Closure $next)
    {
        if (!$request->ajax() && !$request->wantsJson()) {
            if (!\App\Core\Base\Supports\Core::make()->verifyLicense(true)) {
                return redirect()->route('unlicensed');
            }
        }

        return $next($request);
    }
}
