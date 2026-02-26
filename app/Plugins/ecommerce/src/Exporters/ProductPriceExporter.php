<?php

namespace App\Plugins\Ecommerce\Exporters;

use App\Packages\DataSynchronize\Exporter\ExportColumn;
use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Plugins\Ecommerce\Models\Product;
use Illuminate\Support\Collection;

class ProductPriceExporter extends Exporter
{
    public function getLabel(): string
    {
        return trans('plugins/ecommerce::product-prices.name');
    }

    public function columns(): array
    {
        return [
            ExportColumn::make('id')
                ->label('ID')
                ->disabled(),
            ExportColumn::make('name')
                ->disabled(),
            ExportColumn::make('sku')
                ->label('SKU')
                ->disabled(),
            ExportColumn::make('cost_per_item')
                ->disabled(),
            ExportColumn::make('price')
                ->disabled(),
            ExportColumn::make('sale_price')
                ->disabled(),
        ];
    }

    public function collection(): Collection
    {
        return Product::getGroupedVariationQuery()
            ->addSelect([
                'ec_products.cost_per_item',
                'ec_products.price',
                'ec_products.sale_price',
            ])
            ->get();
    }
}
