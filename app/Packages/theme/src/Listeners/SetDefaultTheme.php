<?php

namespace App\Packages\Theme\Listeners;

use App\Core\Setting\Facades\Setting;
use App\Packages\Theme\Facades\Theme;

class SetDefaultTheme
{
    public function handle(): void
    {
        Setting::forceSet('theme', Theme::getThemeName())->set('show_admin_bar', 1)->save();
    }
}
