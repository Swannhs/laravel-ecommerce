<?php

namespace App\Plugins\Marketplace\Exporters;

use App\Plugins\Ecommerce\Exporters\ProductExporter as BaseProductExporter;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Ecommerce\Models\ProductVariation;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use Illuminate\Database\Eloquent\Builder;

class ProductExporter extends BaseProductExporter
{
    protected ?string $storeId;

    public function __construct()
    {
        parent::__construct();

        $this->storeId = auth('customer')->user()->store?->id;
    }

    public function getLayout(): string
    {
        return MarketplaceHelper::viewPath('vendor-dashboard.layouts.master');
    }

    public function hasDataToExport(): bool
    {
        return Product::query()->where('store_id', $this->storeId)->exists();
    }

    protected function getProductQuery(): Builder
    {
        return parent::getProductQuery()->where('store_id', $this->storeId);
    }

    protected function getProductsCount(): int
    {
        return Product::query()
            ->where('store_id', $this->storeId)
            ->where('is_variation', false)
            ->count();
    }

    protected function getVariationsCount(): int
    {
        return ProductVariation::query()
            ->whereHas('product', fn (Builder $query) => $query->where('store_id', $this->storeId))
            ->whereHas(
                'configurableProduct',
                fn (Builder $query) => $query->where('store_id', $this->storeId)->where('is_variation', false)
            )
            ->count();
    }
}
