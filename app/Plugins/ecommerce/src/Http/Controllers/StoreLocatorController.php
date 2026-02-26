<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Forms\StoreLocatorForm;
use App\Plugins\Ecommerce\Http\Requests\StoreLocatorRequest;
use App\Plugins\Ecommerce\Models\StoreLocator;
use App\Core\Setting\Supports\SettingStore;

class StoreLocatorController extends BaseController
{
    public function store(StoreLocatorRequest $request)
    {
        StoreLocator::query()->create([
            ...$request->validated(),
            'is_primary' => false,
        ]);

        return $this
            ->httpResponse()
            ->withCreatedSuccessMessage();
    }

    public function edit(int|string|null $id = null)
    {
        $locator = $id ? StoreLocator::query()->findOrFail($id) : new StoreLocator();

        $form = StoreLocatorForm::createFromModel($locator)
            ->setUrl($locator->exists ? route('ecommerce.store-locators.edit.post', $locator->getKey()) : route('ecommerce.store-locators.create'))
            ->renderForm();

        return $this
            ->httpResponse()
            ->setData($form);
    }

    public function update(StoreLocator $locator, StoreLocatorRequest $request, SettingStore $settingStore)
    {
        $locator->update($request->validated());

        if ($locator->is_primary) {
            $this->syncPrimaryStoreSettings($locator, $settingStore);
        }

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }

    public function syncPrimaryStoreSettings(StoreLocator $locator, SettingStore $settingStore): void
    {
        $prefix = EcommerceHelper::getSettingPrefix();

        $settingStore
            ->set([
                $prefix . 'store_name' => $locator->name,
                $prefix . 'store_phone' => $locator->phone,
                $prefix . 'store_email' => $locator->email,
                $prefix . 'store_address' => $locator->address,
                $prefix . 'store_country' => $locator->country,
                $prefix . 'store_state' => $locator->state,
                $prefix . 'store_city' => $locator->city,
                $prefix . 'store_zip_code' => $locator->zip_code,
            ])
            ->save();
    }

    public function destroy(StoreLocator $locator)
    {
        return DeleteResourceAction::make($locator);
    }
}
