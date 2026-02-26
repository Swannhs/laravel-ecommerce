<?php

namespace App\Plugins\Marketplace\Http\Controllers;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Facades\EmailHandler;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;

class ProductController extends BaseController
{
    public function approveProduct(int|string $id)
    {
        $product = Product::query()->findOrFail($id);

        $product->status = BaseStatusEnum::PUBLISHED;
        $product->approved_by = auth()->id();

        $product->save();

        $variationProductIds = $product->variations()->pluck('product_id')->all();

        if ($variationProductIds) {
            Product::query()
                ->whereIn('id', $variationProductIds)
                ->update(['status' => BaseStatusEnum::PUBLISHED]);
        }

        if (MarketplaceHelper::getSetting('enable_product_approval', 1)) {
            $store = $product->store;

            EmailHandler::setModule(MARKETPLACE_MODULE_SCREEN_NAME)
                ->setVariableValues([
                    'store_name' => $store->name,
                ])
                ->sendUsingTemplate('product-approved', $store->email);
        }

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/marketplace::store.approve_product_success'));
    }
}
