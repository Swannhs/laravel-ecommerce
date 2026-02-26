<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Plugins\Ecommerce\Forms\Settings\StandardAndFormatSettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\StandardAndFormatSettingRequest;

class StandardAndFormatSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.standard_and_format.name'));

        return StandardAndFormatSettingForm::create()->renderForm();
    }

    public function update(StandardAndFormatSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
