<?php

namespace App\Plugins\Marketplace\Http\Controllers\Vendor;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Marketplace\Forms\Vendor\LanguageSettingForm;
use App\Plugins\Marketplace\Http\Requests\Vendor\LanguageSettingRequest;

class LanguageSettingController extends BaseController
{
    public function index()
    {
        $this->pageTitle(trans('plugins/marketplace::marketplace.settings.title'));

        /**
         * @var Customer $customer
         */
        $customer = auth('customer')->user();

        return LanguageSettingForm::createFromModel($customer)->renderForm();
    }

    public function update(LanguageSettingRequest $request)
    {
        /**
         * @var Customer $customer
         */
        $customer = auth('customer')->user();

        LanguageSettingForm::createFromModel($customer)
            ->setRequest($request)
            ->save();

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('marketplace.vendor.language-settings.index'))
            ->withUpdatedSuccessMessage();
    }
}
