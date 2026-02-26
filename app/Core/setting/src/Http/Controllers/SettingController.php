<?php

namespace App\Core\Setting\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Supports\Breadcrumb;
use App\Core\Setting\Http\Controllers\Concerns\InteractsWithSettings;

abstract class SettingController extends BaseController
{
    use InteractsWithSettings;

    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/setting::setting.title'), route('settings.index'));
    }
}
