<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Plugins\Ecommerce\Forms\Settings\AbandonedCartSettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\AbandonedCartSettingRequest;

class AbandonedCartSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.abandoned_cart.name'));

        return AbandonedCartSettingForm::create()->renderForm();
    }

    public function update(AbandonedCartSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
