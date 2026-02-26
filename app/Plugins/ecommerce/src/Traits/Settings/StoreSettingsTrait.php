<?php

namespace App\Plugins\Ecommerce\Traits\Settings;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Core\Setting\Facades\Setting;

trait StoreSettingsTrait
{
    protected function saveSettings(array $settings): void
    {
        if (! $settings) {
            return;
        }

        $prefix = EcommerceHelper::getSettingPrefix();

        foreach ($settings as $key => $value) {
            Setting::set(
                $prefix . $key,
                is_array($value) ? json_encode(array_values(array_filter($value))) : $value
            );
        }

        Setting::save();
    }
}
