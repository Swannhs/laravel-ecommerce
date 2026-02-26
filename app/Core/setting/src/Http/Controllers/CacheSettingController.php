<?php

namespace App\Core\Setting\Http\Controllers;

use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Setting\Forms\CacheSettingForm;
use App\Core\Setting\Http\Requests\CacheSettingRequest;

class CacheSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('core/setting::setting.cache.title'));

        return CacheSettingForm::create()->renderForm();
    }

    public function update(CacheSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
