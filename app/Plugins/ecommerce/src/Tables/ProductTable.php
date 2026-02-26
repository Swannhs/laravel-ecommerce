<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Packages\DataSynchronize\Table\HeaderActions\ExportHeaderAction;
use App\Packages\DataSynchronize\Table\HeaderActions\ImportHeaderAction;
use App\Plugins\Ecommerce\Enums\ProductTypeEnum;
use App\Plugins\Ecommerce\Enums\StockStatusEnum;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Brand;
use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Ecommerce\Models\ProductCategory;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\Actions\ViewAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\IsFeaturedBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\NumberBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\ImageColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Builder as EloquentBuilder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Relation as EloquentRelation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class ProductTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Product::class)
            ->addActions([
                ViewAction::make()->route('products.view'),
                EditAction::make()->route('products.edit'),
                DeleteAction::make()->route('products.destroy'),
            ])
            ->addHeaderActions([
                ExportHeaderAction::make()
                    ->route('tools.data-synchronize.export.products.index')
                    ->permission('ecommerce.export.products.index'),
                ImportHeaderAction::make()
                    ->route('tools.data-synchronize.import.products.index')
                    ->permission('ecommerce.import.products.index'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('products.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                ImageColumn::make(),
                Column::make('name')
                    ->title(trans('plugins/ecommerce::products.name'))
                    ->alignStart(),
                Column::make('price')
                    ->title(trans('plugins/ecommerce::products.price'))
                    ->alignStart(),
                Column::make('stock_status')
                    ->title(trans('plugins/ecommerce::products.stock_status')),
                Column::make('quantity')
                    ->title(trans('plugins/ecommerce::products.quantity'))
                    ->alignStart(),
                Column::make('sku')
                    ->title(trans('plugins/ecommerce::products.sku'))
                    ->alignStart(),
                Column::make('order')
                    ->title(trans('plugins/ecommerce::ecommerce.sort_order'))
                    ->width(50),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'order',
                        'created_at',
                        'status',
                        'sku',
                        'image',
                        'images',
                        'price',
                        'sale_price',
                        'sale_type',
                        'start_date',
                        'end_date',
                        'quantity',
                        'with_storehouse_management',
                        'stock_status',
                        'product_type',
                    ])
                    ->where('is_variation', 0);
            });
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('name', function (Product $item) {
                $productType = null;

                if (! EcommerceHelper::isDisabledPhysicalProduct() && EcommerceHelper::isEnabledSupportDigitalProducts()) {
                    $productType = Html::tag('small', ' &mdash; ' . $item->product_type->label())->toHtml();
                }

                if (! EcommerceHelper::isDisabledPhysicalProduct() && ! $this->hasPermission('products.edit')) {
                    return BaseHelper::clean($item->name) . $productType;
                }

                return Html::link(
                    route('products.edit', $item->getKey()),
                    BaseHelper::clean($item->name)
                ) . $productType;
            })
            ->editColumn('price', function (Product $item) {
                return $item->price_in_table;
            })
            ->editColumn('quantity', function (Product $item) {
                if (! $item->with_storehouse_management) {
                    return '&#8734;';
                }

                if ($item->variations->isEmpty()) {
                    return $item->quantity;
                }

                $withStoreHouseManagement = $item->with_storehouse_management;

                $quantity = 0;

                foreach ($item->variations as $variation) {
                    if (! $variation->product->with_storehouse_management) {
                        $withStoreHouseManagement = false;

                        break;
                    }

                    $quantity += $variation->product->quantity;
                }

                return $withStoreHouseManagement ? $quantity : '&#8734;';
            })
            ->editColumn('sku', function (Product $item) {
                return BaseHelper::clean($item->sku ?: '&mdash;');
            })
            ->editColumn('order', function (Product $item) {
                return view('plugins/ecommerce::products.partials.sort-order', compact('item'))->render();
            })
            ->editColumn('stock_status', function (Product $item) {
                return BaseHelper::clean($item->stock_status_html);
            })
            ->filter(function ($query) {
                return $query->searchByKeyword(request()->input('search.value'));
            });

        return $this->toJson($data);
    }

    public function htmlDrawCallbackFunction(): ?string
    {
        return parent::htmlDrawCallbackFunction() . 'Botble.initEditable()';
    }

    public function buttons(): array
    {
        $buttons = [];

        if (EcommerceHelper::isEnabledSupportDigitalProducts() && ! EcommerceHelper::isDisabledPhysicalProduct() && $this->hasPermission('products.create')) {
            $buttons['create'] = [
                'extend' => 'collection',
                'text' => view('core/table::partials.create')->render(),
                'class' => 'btn-primary',
                'buttons' => [
                    [
                        'className' => 'action-item',
                        'text' => ProductTypeEnum::PHYSICAL()->toIcon() . ' ' . Html::tag(
                            'span',
                            ProductTypeEnum::PHYSICAL()->label(),
                            [
                                'data-action' => 'physical-product',
                                'data-href' => route('products.create'),
                                'class' => 'ms-1',
                            ]
                        )->toHtml(),
                    ],
                    [
                        'className' => 'action-item',
                        'text' => ProductTypeEnum::DIGITAL()->toIcon() . ' ' . Html::tag(
                            'span',
                            ProductTypeEnum::DIGITAL()->label(),
                            [
                                'data-action' => 'digital-product',
                                'data-href' => route('products.create', ['product_type' => 'digital']),
                                'class' => 'ms-1',
                            ]
                        )->toHtml(),
                    ],
                ],
            ];
        } elseif (! EcommerceHelper::isEnabledSupportDigitalProducts() || EcommerceHelper::isDisabledPhysicalProduct()) {
            $buttons = $this->addCreateButton(route('products.create'), 'products.create');
        }

        return $buttons;
    }

    public function renderTable($data = [], $mergeData = []): View|Factory|Response
    {
        if ($this->isEmpty()) {
            return view('plugins/ecommerce::products.intro');
        }

        return parent::renderTable($data, $mergeData);
    }

    public function getFilters(): array
    {
        $data = parent::getFilters();

        $data['category'] = array_merge($data['category'], [
            'type' => 'select-ajax',
        ]);

        $data['brand_id'] = array_merge($data['brand_id'], [
            'type' => 'select-ajax',
        ]);

        $data['stock_status'] = [
            'title' => trans('plugins/ecommerce::products.form.stock_status'),
            'type' => 'select',
            'choices' => StockStatusEnum::labels(),
            'validate' => 'required|in:' . implode(',', StockStatusEnum::values()),
        ];

        $data['product_type'] = [
            'title' => trans('plugins/ecommerce::products.form.product_type.title'),
            'type' => 'select',
            'choices' => ProductTypeEnum::labels(),
            'validate' => 'required|in:' . implode(',', ProductTypeEnum::values()),
        ];

        $data['sku'] = [
            'title' => trans('plugins/ecommerce::products.sku'),
            'type' => 'text',
        ];

        return $data;
    }

    public function getBulkChanges(): array
    {
        return [
            NameBulkChange::make(),
            NumberBulkChange::make()
                ->name('order')
                ->title(trans('plugins/ecommerce::ecommerce.sort_order')),
            'category' => [
                'title' => trans('plugins/ecommerce::products.category'),
                'type' => 'select-ajax',
                'validate' => 'required',
                'callback' => function (int|string|null $value = null): array {
                    $categorySelected = [];
                    if ($value && $category = ProductCategory::query()->find($value)) {
                        $categorySelected = [$category->getKey() => $category->name];
                    }

                    return [
                        'url' => route('product-categories.search'),
                        'selected' => $categorySelected,
                        'minimum-input' => 1,
                    ];
                },
            ],
            'brand_id' => [
                'title' => trans('plugins/ecommerce::products.brand'),
                'type' => 'select-ajax',
                'validate' => 'required',
                'callback' => function (int|string|null $value = null): array {
                    $brandSelected = [];
                    if ($value && $brand = Brand::query()->find($value)) {
                        $brandSelected = [$brand->getKey() => $brand->name];
                    }

                    return [
                        'url' => route('brands.search'),
                        'selected' => $brandSelected,
                        'minimum-input' => 1,
                    ];
                },
            ],
            StatusBulkChange::make(),
            CreatedAtBulkChange::make(),
            IsFeaturedBulkChange::make(),
        ];
    }

    public function applyFilterCondition(
        EloquentBuilder|QueryBuilder|EloquentRelation $query,
        string $key,
        string $operator,
        ?string $value
    ): EloquentRelation|EloquentBuilder|QueryBuilder {
        switch ($key) {
            case 'created_at':
                if (! $value) {
                    break;
                }

                $value = BaseHelper::formatDate($value);

                return $query->whereDate('ec_products.' . $key, $operator, $value);
            case 'category':
                if (! $value) {
                    break;
                }

                if (! BaseHelper::isJoined($query, 'ec_product_categories')) {
                    $query = $query
                        ->join(
                            'ec_product_category_product',
                            'ec_product_category_product.product_id',
                            '=',
                            'ec_products.id'
                        )
                        ->join(
                            'ec_product_categories',
                            'ec_product_category_product.category_id',
                            '=',
                            'ec_product_categories.id'
                        )
                        ->select($query->getModel()->getTable() . '.*');
                }

                $category = ProductCategory::query()->find($value);

                if (! $category) {
                    break;
                }

                $categoryIds = ProductCategory::getChildrenIds($category->activeChildren, [$category->getKey()]);

                return $query->whereIn('ec_product_category_product.category_id', $categoryIds);

            case 'brand':
                if (! $value) {
                    break;
                }

                return $query->where('ec_products.brand_id', $operator, $value);

            case 'stock_status':
                if (! $value) {
                    break;
                }

                if ($value == StockStatusEnum::ON_BACKORDER) {
                    return parent::applyFilterCondition($query, $key, $operator, $value);
                }

                if ($value == StockStatusEnum::OUT_OF_STOCK) {
                    return $query
                        ->where(function ($query): void {
                            $query
                                ->where(function ($subQuery): void {
                                    $subQuery
                                        ->where('with_storehouse_management', 0)
                                        ->where('stock_status', StockStatusEnum::OUT_OF_STOCK);
                                })
                                ->orWhere(function ($subQuery): void {
                                    $subQuery
                                        ->where('with_storehouse_management', 1)
                                        ->where('allow_checkout_when_out_of_stock', 0)
                                        ->where('quantity', '<=', 0);
                                });
                        });
                }

                if ($value == StockStatusEnum::IN_STOCK) {
                    return $query
                        ->where(function ($query) {
                            return $query
                                ->where(function ($subQuery): void {
                                    $subQuery
                                        ->where('with_storehouse_management', 0)
                                        ->where('stock_status', StockStatusEnum::IN_STOCK);
                                })
                                ->orWhere(function ($subQuery): void {
                                    $subQuery
                                        ->where('with_storehouse_management', 1)
                                        ->where(function ($sub): void {
                                            $sub
                                                ->where('allow_checkout_when_out_of_stock', 1)
                                                ->orWhere('quantity', '>', 0);
                                        });
                                });
                        });
                }
        }

        return parent::applyFilterCondition($query, $key, $operator, $value);
    }

    public function saveBulkChangeItem(Model|Product $item, string $inputKey, ?string $inputValue): Model|bool
    {
        if ($inputKey === 'category') {
            /**
             * @var Product $item
             */
            $item->categories()->sync([$inputValue]);

            return $item;
        }

        return parent::saveBulkChangeItem($item, $inputKey, $inputValue);
    }
}
