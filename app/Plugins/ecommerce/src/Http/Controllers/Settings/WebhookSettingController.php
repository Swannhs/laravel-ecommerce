<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Plugins\Ecommerce\Forms\Settings\WebhookSettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\WebhookSettingRequest;

class WebhookSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.webhook.name'));

        return WebhookSettingForm::create()->renderForm();
    }

    public function update(WebhookSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
