<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Core\Base\Facades\Assets;
use App\Plugins\Ecommerce\Events\ProductQuantityUpdatedEvent;
use App\Plugins\Ecommerce\Http\Requests\UpdateProductInventoryRequest;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Ecommerce\Services\Products\UpdateDefaultProductService;
use App\Plugins\Ecommerce\Tables\ProductInventoryTable;

class ProductInventoryController extends BaseController
{
    public function index(ProductInventoryTable $dataTable)
    {
        $this->pageTitle(trans('plugins/ecommerce::product-inventory.name'));

        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/product-bulk-editable-table.js');

        return $dataTable->renderTable();
    }

    public function update(Product $product, UpdateProductInventoryRequest $request)
    {
        $column = $request->input('column');
        $value = $request->input('value');

        $product->forceFill([
            $column => $value,
        ])->save();

        if ($product->is_variation) {
            $product->load('variationInfo.configurableProduct');

            if ($product->variationInfo->is_default) {
                app(UpdateDefaultProductService::class)->execute($product);
            }
        }

        // Trigger event if quantity or stock status was updated to update parent product
        if (in_array($column, ['quantity', 'stock_status', 'with_storehouse_management'])) {
            event(new ProductQuantityUpdatedEvent($product));
        }

        return $this->httpResponse()->withUpdatedSuccessMessage();
    }
}
