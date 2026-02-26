<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Core\Base\Facades\Assets;
use App\Plugins\Ecommerce\Models\StoreLocator;

class StoreLocatorSettingController extends SettingController
{
    public function index()
    {
        $this->pageTitle(trans('plugins/ecommerce::setting.store_locator.name'));

        Assets::addScripts(['jquery-ui'])
            ->addScriptsDirectly([
                'vendor/core/plugins/ecommerce/js/store-locator.js',
                'vendor/core/plugins/location/js/location.js',
            ]);

        $storeLocators = StoreLocator::query()->get();

        return view('plugins/ecommerce::settings.store-locator', compact('storeLocators'));
    }
}
