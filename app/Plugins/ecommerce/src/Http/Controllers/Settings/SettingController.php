<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Core\Setting\Http\Controllers\SettingController as BaseSettingController;

abstract class SettingController extends BaseSettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/ecommerce::setting.ecommerce'));
    }

    protected function saveSettings(array $data, string $prefix = ''): void
    {
        parent::saveSettings($data, EcommerceHelper::getSettingPrefix());
    }
}
