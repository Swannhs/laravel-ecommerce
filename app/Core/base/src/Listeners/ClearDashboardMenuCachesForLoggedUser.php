<?php

namespace App\Core\Base\Listeners;

use App\Core\ACL\Models\User;
use App\Core\Base\Facades\DashboardMenu;
use Illuminate\Auth\Events\Login;

class ClearDashboardMenuCachesForLoggedUser
{
    public function handle(Login $event): void
    {
        if (! $event->user instanceof User) {
            return;
        }

        DashboardMenu::default()->clearCachesForCurrentUser();
    }
}
