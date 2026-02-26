<?php

namespace App\Packages\Optimize\Http\Controllers\Settings;

use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Packages\Optimize\Forms\Settings\OptimizeSettingForm;
use App\Packages\Optimize\Http\Requests\OptimizeSettingRequest;
use App\Core\Setting\Http\Controllers\SettingController;

class OptimizeSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('packages/optimize::optimize.settings.title'));

        return OptimizeSettingForm::create()->renderForm();
    }

    public function update(OptimizeSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
