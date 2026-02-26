<?php

namespace App\Plugins\Marketplace\Http\Controllers\Settings;

use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Core\Setting\Http\Controllers\SettingController as BaseSettingController;

abstract class SettingController extends BaseSettingController
{
    protected function saveSettings(array $data, string $prefix = ''): void
    {
        parent::saveSettings($data, MarketplaceHelper::getSettingKey());
    }
}
