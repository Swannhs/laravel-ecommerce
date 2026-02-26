<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Plugins\Ecommerce\Forms\Settings\InvoiceSettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\InvoiceSettingRequest;

class InvoiceSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.invoice.name'));

        return InvoiceSettingForm::create()->renderForm();
    }

    public function update(InvoiceSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
