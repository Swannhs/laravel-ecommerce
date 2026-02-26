<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Http\Requests\UpdatePrimaryStoreRequest;
use App\Plugins\Ecommerce\Models\StoreLocator;
use App\Core\Setting\Supports\SettingStore;

class ChangePrimaryStoreController extends BaseController
{
    public function __invoke(UpdatePrimaryStoreRequest $request, SettingStore $settingStore)
    {
        $storeLocator = StoreLocator::query()->findOrFail($request->input('primary_store_id'));

        StoreLocator::query()->where('id', '!=', $storeLocator->getKey())->update(['is_primary' => false]);

        $storeLocator->update([
            'is_primary' => true,
        ]);

        app(StoreLocatorController::class)->syncPrimaryStoreSettings($storeLocator, $settingStore);

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }
}
