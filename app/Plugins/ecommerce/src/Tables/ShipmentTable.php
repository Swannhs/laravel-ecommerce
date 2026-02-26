<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Plugins\Ecommerce\Enums\ShippingStatusEnum;
use App\Plugins\Ecommerce\Models\Shipment;
use App\Plugins\Ecommerce\Models\StoreLocator;
use App\Plugins\Ecommerce\Tables\Formatters\PriceFormatter;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;

class ShipmentTable extends TableAbstract
{
    protected bool $hasMultipleStores = false;

    public function setup(): void
    {
        $this->hasMultipleStores = StoreLocator::query()->where('is_shipping_location', true)->count() > 1;

        $this
            ->model(Shipment::class)
            ->addActions([
                EditAction::make()->route('ecommerce.shipments.edit'),
                DeleteAction::make()->route('ecommerce.shipments.destroy'),
            ])
            ->queryUsing(function (Builder $query) {
                $select = [
                    'id',
                    'order_id',
                    'user_id',
                    'price',
                    'status',
                    'cod_status',
                    'created_at',
                ];

                if ($this->hasMultipleStores) {
                    $select[] = 'store_id';
                }

                return $query->select($select);
            })
            ->addColumns($this->getTableColumns());

        $this
            ->addBulkActions([
                DeleteBulkAction::make()->permission('ecommerce.shipments.destroy'),
            ])
            ->addBulkChanges([
                StatusBulkChange::make()->choices(ShippingStatusEnum::labels())
                    ->validate('required|in:' . implode(',', ShippingStatusEnum::values())),
                CreatedAtBulkChange::make(),
            ])
            ->onAjax(function (self $table) {
                return $table->toJson(
                    $table
                        ->table
                        ->eloquent($table->query())
                        ->editColumn('order_id', function (Shipment $item) {
                            if (! $this->hasPermission('orders.edit')) {
                                return $item->order->code;
                            }

                            return Html::link(
                                route('orders.edit', $item->order->id),
                                $item->order->code . BaseHelper::renderIcon('ti ti-external-link'),
                                ['target' => '_blank'],
                                null,
                                false
                            );
                        })
                        ->formatColumn('price', PriceFormatter::class)
                        ->editColumn('cod_status', function (Shipment $item) {
                            if (! (float) $item->cod_amount) {
                                return BaseHelper::renderBadge(trans('plugins/ecommerce::shipping.not_available'), 'info');
                            }

                            return BaseHelper::clean($item->cod_status->toHtml());
                        })
                        ->filter(function ($query) {
                            $keyword = $this->request->input('search.value');
                            if ($keyword) {
                                return $query
                                    ->whereHas('order.address', function ($subQuery) use ($keyword) {
                                        return $subQuery->where('ec_order_addresses.name', 'LIKE', '%' . $keyword . '%');
                                    });
                            }

                            return $query;
                        })
                );
            });
    }

    protected function getTableColumns(): array
    {
        $columns = [
            IdColumn::make(),
            Column::make('order_id')->title(trans('plugins/ecommerce::shipping.order_id')),
            FormattedColumn::make('user_id')
                ->title(trans('plugins/ecommerce::order.customer_label'))
                ->alignStart()
                ->orderable(false)
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem()->order;

                    return sprintf(
                        '%s <br> %s <br> %s',
                        $item->user->name ?: $item->address->name,
                        Html::mailto($item->user->email ?: $item->address->email, obfuscate: false),
                        $item->user->phone ?: $item->address->phone
                    );
                }),
            Column::formatted('price')
                ->title(trans('plugins/ecommerce::shipping.shipping_amount')),
        ];

        if ($this->hasMultipleStores) {
            $columns[] = FormattedColumn::make('store_id')
                ->title(trans('plugins/ecommerce::shipping.warehouse'))
                ->orderable(false)
                ->renderUsing(function (FormattedColumn $column) {
                    $store = $column->getItem()->store;

                    return $store->name ?: '-';
                });
        }

        $columns[] = StatusColumn::make();
        $columns[] = Column::make('cod_status')->title(trans('plugins/ecommerce::shipping.cod_status'));
        $columns[] = CreatedAtColumn::make();

        return $columns;
    }
}
