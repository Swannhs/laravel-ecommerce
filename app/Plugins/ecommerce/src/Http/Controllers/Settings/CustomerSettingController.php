<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Core\Base\Exceptions\DisabledInDemoModeException;
use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Ecommerce\Forms\Settings\CustomerSettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\CustomerSettingRequest;

class CustomerSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.customer.name'));

        return CustomerSettingForm::create()->renderForm();
    }

    public function update(CustomerSettingRequest $request)
    {
        if (BaseHelper::hasDemoModeEnabled()) {
            throw new DisabledInDemoModeException();
        }

        $data = $request->validated();

        return $this->performUpdate($data);
    }
}
