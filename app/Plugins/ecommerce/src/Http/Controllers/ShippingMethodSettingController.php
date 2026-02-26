<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Services\HandleShippingFeeService;
use App\Core\Setting\Supports\SettingStore;
use App\Core\Support\Services\Cache\Cache;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;

class ShippingMethodSettingController extends BaseController
{
    public function update(Request $request, SettingStore $settingStore)
    {
        $data = Arr::where($request->except(['_token']), function ($value, $key) {
            return Str::startsWith($key, 'shipping_');
        });

        foreach ($data as $settingKey => $settingValue) {
            $settingStore->set($settingKey, $settingValue);
        }

        $settingStore->save();

        Cache::make(HandleShippingFeeService::class)->flush();

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/ecommerce::shipping.saved_shipping_settings_success'));
    }
}
