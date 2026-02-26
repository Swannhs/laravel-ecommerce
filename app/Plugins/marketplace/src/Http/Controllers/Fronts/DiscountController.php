<?php

namespace App\Plugins\Marketplace\Http\Controllers\Fronts;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Models\Discount;
use App\Core\JsValidation\Facades\JsValidator;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Http\Requests\Fronts\DiscountRequest;
use App\Plugins\Marketplace\Tables\DiscountTable;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class DiscountController extends BaseController
{
    public function index(DiscountTable $table)
    {
        $this->pageTitle(trans('plugins/ecommerce::discount.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/ecommerce::discount.create'));

        Assets::addStylesDirectly(['vendor/core/plugins/ecommerce/css/ecommerce.css'])
            ->addScriptsDirectly([
                'vendor/core/plugins/marketplace/js/discount.js',
            ])
            ->addScripts(['timepicker', 'input-mask'])
            ->addStyles(['timepicker']);

        Assets::usingVueJS();

        Assets::addScripts(['form-validation']);

        $jsValidation = JsValidator::formRequest(DiscountRequest::class, '#marketplace-vendor-discount');

        return MarketplaceHelper::view('vendor-dashboard.discounts.create', compact('jsValidation'));
    }

    protected function getStore()
    {
        return auth('customer')->user()->store;
    }

    public function store(DiscountRequest $request)
    {
        $request->merge([
            'can_use_with_promotion' => 0,
            'display_at_checkout' => false,
        ]);

        if ($request->input('is_unlimited')) {
            $request->merge(['quantity' => null]);
        }

        $discount = new Discount();

        $discount->fill($request->input());

        $discount->store_id = $this->getStore()->id;
        $discount->save();

        event(new CreatedContentEvent(DISCOUNT_MODULE_SCREEN_NAME, $request, $discount));

        return $this
            ->httpResponse()
            ->setNextUrl(route('marketplace.vendor.discounts.index'))
            ->withCreatedSuccessMessage();
    }

    public function destroy(Discount $discount, Request $request)
    {
        abort_if($discount->store_id !== $this->getStore()->id, 403);

        try {
            $discount->delete();

            event(new DeletedContentEvent(DISCOUNT_MODULE_SCREEN_NAME, $request, $discount));

            return $this
                ->httpResponse()
                ->setMessage(trans('core/base::notices.delete_success_message'));
        } catch (Exception $exception) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($exception->getMessage());
        }
    }

    public function postGenerateCoupon()
    {
        do {
            $code = strtoupper(Str::random(12));
        } while (Discount::query()->where('code', $code)->exists());

        return $this
            ->httpResponse()
            ->setData($code);
    }
}
