<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Core\Base\Facades\Assets;
use App\Plugins\Ecommerce\Forms\Settings\ShippingSettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\ShippingSettingRequest;
use App\Plugins\Ecommerce\Models\Shipping;
use App\Plugins\Ecommerce\Services\HandleShippingFeeService;
use App\Core\Support\Services\Cache\Cache;

class ShippingSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.shipping.name'));

        Assets::addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScriptsDirectly(['vendor/core/plugins/ecommerce/js/shipping.js'])
            ->addScripts(['input-mask']);

        $form = ShippingSettingForm::create();

        $shipping = Shipping::query()
            ->with([
                'rules' => function ($query): void {
                    $query->withCount('items');
                },
            ])
            ->get();

        Cache::make(HandleShippingFeeService::class)->flush();

        return view('plugins/ecommerce::settings.shipping', compact('shipping', 'form'));
    }

    public function update(ShippingSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
