<?php

namespace App\Plugins\Captcha;

use App\Packages\PluginManagement\Abstracts\PluginOperationAbstract;
use App\Core\Setting\Facades\Setting;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Setting::delete([
            'enable_captcha',
            'captcha_type',
            'captcha_hide_badge',
            'captcha_site_key',
            'captcha_secret',
        ]);
    }
}
