<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Plugins\Ecommerce\Forms\Settings\ProductSettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\ProductSettingRequest;

class ProductSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::products.name'));

        return ProductSettingForm::create()->renderForm();
    }

    public function update(ProductSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
