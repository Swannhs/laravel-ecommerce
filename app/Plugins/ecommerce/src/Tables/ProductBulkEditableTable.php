<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Plugins\Ecommerce\Models\Product;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\ImageColumn;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Arr;

abstract class ProductBulkEditableTable extends TableAbstract
{
    protected int $pageLength = 100;

    protected array $productIds = [];

    protected bool $hasResponsive = false;

    public function hasColumnVisibilityEnabled(): bool
    {
        return false;
    }

    public function setup(): void
    {
        $this
            ->addColumns([
                IdColumn::make()
                    ->orderable(false)
                    ->getValueUsing(function (IdColumn $column) {
                        return ! $column->getItem()->is_variation ? $column->getItem()->id : '';
                    }),
                ImageColumn::make()
                    ->orderable(false)
                    ->renderUsing(function (ImageColumn $column, $content) {
                        $images = $column->getItem()->images;
                        $images = $images ? json_decode($images, true) : [];
                        $firstImage = Arr::first($images) ?: null;

                        if ($column->getItem()->is_variation) {
                            return '';
                        }

                        $content = $content ?: $firstImage;

                        return $column->formattedValue($content);
                    }),
                FormattedColumn::make('name')
                    ->title(trans('plugins/ecommerce::products.name'))
                    ->renderUsing(function (FormattedColumn $column) {
                        return view('plugins/ecommerce::product-prices.columns.name', [
                            'product' => $column->getItem(),
                        ]);
                    })
                    ->orderable(false),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->query($this->query())
            ->filter(function ($query) {
                $keyword = $this->request()->input('search.value');

                if ($keyword) {
                    $keyword = '%' . $keyword . '%';

                    $query
                        ->where('ec_products.name', 'LIKE', $keyword)
                        ->orWhere('ec_products.sku', 'LIKE', $keyword);

                    return $query;
                }

                return $query;
            });

        return $this->toJson($data);
    }

    protected function hasOperations(): bool
    {
        return false;
    }

    public function query()
    {
        return $this->applyScopes(Product::getGroupedVariationQuery());
    }
}
