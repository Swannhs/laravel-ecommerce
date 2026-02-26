<?php

namespace App\Core\Base\Providers;

use App\Core\ACL\Models\User;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Media\Facades\RvMedia;
use Illuminate\Contracts\View\Factory;
use Illuminate\Support\Facades\Auth;

class ComposerServiceProvider extends ServiceProvider
{
    public function boot(Factory $view): void
    {
        $view->composer(['core/media::config'], function (): void {
            $mediaPermissions = RvMedia::getConfig('permissions', []);

            if (Auth::guard()->check()) {
                /**
                 * @var User $user
                 */
                $user = Auth::guard()->user();

                if (! $user->isSuperUser() && $user->permissions) {
                    $mediaPermissions = array_intersect(array_keys($user->permissions), $mediaPermissions);
                }
            }

            RvMedia::setPermissions($mediaPermissions);
        });
    }
}
