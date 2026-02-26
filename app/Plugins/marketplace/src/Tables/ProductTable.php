<?php

namespace App\Plugins\Marketplace\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Packages\DataSynchronize\Table\HeaderActions\ExportHeaderAction;
use App\Packages\DataSynchronize\Table\HeaderActions\ImportHeaderAction;
use App\Plugins\Ecommerce\Enums\ProductTypeEnum;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Marketplace\Exports\ProductExport;
use App\Plugins\Marketplace\Tables\Traits\ForVendor;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\Actions\ViewAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\NumberBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\ImageColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class ProductTable extends TableAbstract
{
    use ForVendor;

    public function setup(): void
    {
        $this->exportClass = ProductExport::class;

        $this
            ->model(Product::class)
            ->addHeaderActions([
                ExportHeaderAction::make()->route('marketplace.vendor.export.products.index'),
                ImportHeaderAction::make()->route('marketplace.vendor.import.products.index'),
            ])
            ->addActions([
                ViewAction::make()->route('marketplace.vendor.products.view'),
                EditAction::make()->route('marketplace.vendor.products.edit'),
                DeleteAction::make()->route('marketplace.vendor.products.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('price', function ($item) {
                return $item->price_in_table;
            })
            ->editColumn('quantity', function ($item) {
                return $item->with_storehouse_management ? $item->quantity : '&#8734;';
            })
            ->editColumn('sku', function ($item) {
                return BaseHelper::clean($item->sku ?: '&mdash;');
            })
            ->editColumn('order', function ($item) {
                return (string) $item->order;
            })
            ->filter(function ($query) {
                return $query->searchByKeyword(request()->input('search.value'));
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this->getModel()->query()
            ->select([
                'id',
                'name',
                'order',
                'created_at',
                'status',
                'sku',
                'images',
                'price',
                'sale_price',
                'sale_type',
                'start_date',
                'end_date',
                'quantity',
                'with_storehouse_management',
                'product_type',
            ])
            ->where('is_variation', 0)
            ->where('store_id', auth('customer')->user()->store?->id);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            ImageColumn::make(),
            NameColumn::make()->route('marketplace.vendor.products.edit'),
            Column::make('price')
                ->title(trans('plugins/ecommerce::products.price'))
                ->alignStart(),
            Column::make('quantity')
                ->title(trans('plugins/ecommerce::products.quantity'))
                ->alignStart(),
            Column::make('sku')
                ->title(trans('plugins/ecommerce::products.sku'))
                ->alignStart(),
            Column::make('order')
                ->title(trans('core/base::tables.order'))
                ->width(50),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function buttons(): array
    {
        $buttons = [];

        if (EcommerceHelper::isEnabledSupportDigitalProducts() && ! EcommerceHelper::isDisabledPhysicalProduct()) {
            $buttons['create'] = [
                'extend' => 'collection',
                'text' => view('core/table::partials.create')->render(),
                'class' => 'btn-primary',
                'buttons' => [
                    [
                        'className' => 'action-item',
                        'text' => ProductTypeEnum::PHYSICAL()->toIcon() . ' ' . Html::tag('span', ProductTypeEnum::PHYSICAL()->label(), [
                            'data-action' => 'physical-product',
                            'data-href' => route('marketplace.vendor.products.create'),
                            'class' => 'ms-1',
                        ])->toHtml(),
                    ],
                    [
                        'className' => 'action-item',
                        'text' => ProductTypeEnum::DIGITAL()->toIcon() . ' ' . Html::tag('span', ProductTypeEnum::DIGITAL()->label(), [
                            'data-action' => 'digital-product',
                            'data-href' => route('marketplace.vendor.products.create', ['product_type' => 'digital']),
                            'class' => 'ms-1',
                        ])->toHtml(),
                    ],
                ],
            ];
        } elseif (! EcommerceHelper::isEnabledSupportDigitalProducts() || EcommerceHelper::isDisabledPhysicalProduct()) {
            $buttons = $this->addCreateButton(route('marketplace.vendor.products.create'));
        }

        return $buttons;
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::class,
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            NameBulkChange::make(),
            NumberBulkChange::make()
                ->name('order')
                ->title(trans('core/base::tables.order')),
            StatusBulkChange::make(),
            CreatedAtBulkChange::make(),
        ];
    }
}
