<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Plugins\Ecommerce\Forms\Settings\DigitalProductSettingFom;
use App\Plugins\Ecommerce\Http\Requests\Settings\DigitalProductSettingRequest;

class DigitalProductSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.digital_product.name'));

        return DigitalProductSettingFom::create()->renderForm();
    }

    public function update(DigitalProductSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
