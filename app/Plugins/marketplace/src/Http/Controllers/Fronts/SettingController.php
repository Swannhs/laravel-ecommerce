<?php

namespace App\Plugins\Marketplace\Http\Controllers\Fronts;

use App\Core\Base\Events\UpdatedContentEvent;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\MetaBox;
use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Rules\MediaImageRule;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Forms\PayoutInformationForm;
use App\Plugins\Marketplace\Forms\TaxInformationForm;
use App\Plugins\Marketplace\Forms\VendorStoreForm;
use App\Plugins\Marketplace\Http\Requests\Fronts\VendorStoreRequest;
use App\Plugins\Marketplace\Http\Requests\PayoutInformationSettingRequest;
use App\Plugins\Marketplace\Http\Requests\TaxInformationSettingRequest;
use App\Plugins\Marketplace\Models\Store;
use App\Core\Media\Facades\RvMedia;
use App\Packages\Slug\Facades\SlugHelper;

class SettingController extends BaseController
{
    public function index()
    {
        $this->pageTitle(trans('plugins/marketplace::marketplace.settings.title'));

        Assets::addScriptsDirectly('vendor/core/plugins/location/js/location.js');

        $store = auth('customer')->user()->store;

        $form = VendorStoreForm::createFromModel($store)
            ->renderForm();

        $taxInformationForm = TaxInformationForm::createFromModel($store->customer)
            ->setUrl(route('marketplace.vendor.settings.post.tax-info'))
            ->renderForm();

        $payoutInformationForm = PayoutInformationForm::createFromModel($store->customer)
            ->setUrl(route('marketplace.vendor.settings.post.payout'))
            ->renderForm();

        return MarketplaceHelper::view(
            'vendor-dashboard.stores.form',
            compact('store', 'form', 'taxInformationForm', 'payoutInformationForm')
        );
    }

    public function saveSettings(VendorStoreRequest $request)
    {
        $store = auth('customer')->user()->store;

        $storeForm = VendorStoreForm::createFromModel($store);

        $storeForm->saving(function (VendorStoreForm $form) use ($request) {

            $store = $form->getModel();

            $existing = SlugHelper::getSlug($request->input('slug'), SlugHelper::getPrefix(Store::class));

            if ($existing && $existing->reference_id != $store->getKey()) {
                return $this->httpResponse()->setError()->setMessage(trans('plugins/marketplace::store.forms.shop_url_existing'));
            }

            $request->validate([
                'logo_input' => ['nullable', new MediaImageRule()],
                'cover_image_input' => ['nullable', new MediaImageRule()],
            ]);

            if ($request->hasFile('logo_input')) {
                $result = RvMedia::handleUpload($request->file('logo_input'), 0, $store->upload_folder);
                if (! $result['error']) {
                    $file = $result['data'];
                    $request->merge(['logo' => $file->url]);
                }
            }

            if ($request->hasFile('cover_image_input')) {
                $result = RvMedia::handleUpload($request->file('cover_image_input'), 0, 'stores');

                if (! $result['error']) {
                    $file = $result['data'];
                    $request->merge(['cover_image' => $file->url]);
                }
            }

            $store->fill($request->input());
            $store->save();

            $request->merge(['is_slug_editable' => 1]);

            if ($request->has('social_links')) {
                if ($socialLinks = $request->input('social_links', [])) {
                    $socials = array_keys(MarketplaceHelper::getAllowedSocialLinks());
                    $socialLinks = collect($socialLinks)->only($socials)->filter();
                    MetaBox::saveMetaBoxData($store, 'social_links', $socialLinks);
                }
            }

            return $form;
        });

        return $this
            ->httpResponse()
            ->setNextUrl(route('marketplace.vendor.settings'))
            ->setMessage(trans('plugins/marketplace::store.update_successfully'));
    }

    public function updateTaxInformation(TaxInformationSettingRequest $request)
    {
        /**
         * @var Store $store
         */
        $store = auth('customer')->user()->store;

        $customer = $store->customer;

        if ($customer && $customer->getKey()) {
            $customer->vendorInfo->update($request->validated());
        }

        event(new UpdatedContentEvent(STORE_MODULE_SCREEN_NAME, $request, $store));

        return $this->httpResponse()
            ->setMessage(trans('plugins/marketplace::store.update_successfully'))
            ->setNextUrl(route('marketplace.vendor.settings'));
    }

    public function updatePayoutInformation(PayoutInformationSettingRequest $request)
    {
        /**
         * @var Store $store
         */
        $store = auth('customer')->user()->store;

        $customer = $store->customer;

        if ($customer && $customer->id) {
            $vendorInfo = $customer->vendorInfo;
            $vendorInfo->payout_payment_method = $request->input('payout_payment_method');
            $vendorInfo->bank_info = $request->input('bank_info', []);
            $vendorInfo->save();
        }

        event(new UpdatedContentEvent(STORE_MODULE_SCREEN_NAME, $request, $store));

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/marketplace::store.update_successfully'))
            ->setNextUrl(route('marketplace.vendor.settings'));
    }
}
