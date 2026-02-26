<?php

namespace App\Plugins\Marketplace\Http\Controllers\Settings;

use App\Core\Base\Facades\DashboardMenu;
use App\Core\Base\Supports\Helper;
use App\Plugins\Ecommerce\Models\ProductCategory;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Forms\Settings\MarketplaceSettingForm;
use App\Plugins\Marketplace\Http\Requests\MarketPlaceSettingFormRequest;
use App\Plugins\Marketplace\Models\Store;
use App\Core\Setting\Facades\Setting;
use Illuminate\Support\Arr;

class MarketplaceSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/marketplace::marketplace.name'));

        $productCategories = ProductCategory::query()->get();

        $form = MarketplaceSettingForm::create();

        return view('plugins/marketplace::settings.index', compact('productCategories', 'form'));
    }

    public function update(MarketPlaceSettingFormRequest $request)
    {
        $validated = Arr::except($request->validated(), 'payout_methods');

        if ($payoutMethod = $request->input('payout_methods')) {
            $preFix = MarketplaceHelper::getSettingKey();

            foreach ($payoutMethod as $key => $value) {
                Setting::set($preFix . 'payout_methods.' . $key, $value);
            }
        }

        if ($request->input('enable_commission_fee_for_each_category')) {
            $commissionByCategories = $request->input('commission_by_category');
            Store::handleCommissionEachCategory($commissionByCategories);
        }

        $preVerifyVendor = MarketplaceHelper::getSetting('verify_vendor', 1);

        if (in_array('fee_per_order', array_keys($validated))) {
            $value = $validated['fee_per_order'];
            $validated['fee_per_order'] = $value < 0 ? 0 : min($value, 100);
        }

        $this->saveSettings($validated);

        if ($preVerifyVendor != MarketplaceHelper::getSetting('verify_vendor', 1)) {
            Helper::clearCache();
        }

        DashboardMenu::clearCachesForCurrentUser();

        return $this
            ->httpResponse()
            ->setNextUrl(route('marketplace.settings'))
            ->withUpdatedSuccessMessage();
    }
}
