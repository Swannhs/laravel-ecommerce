<?php

namespace App\Plugins\Marketplace\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Plugins\Ecommerce\Models\Shipment;
use App\Plugins\Marketplace\Tables\Traits\ForVendor;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class ShipmentTable extends TableAbstract
{
    use ForVendor;

    public function setup(): void
    {
        $this
            ->model(Shipment::class)
            ->addActions([
                EditAction::make()->route('marketplace.vendor.shipments.edit'),
                DeleteAction::make()->route('marketplace.vendor.shipments.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('order_id', function ($item) {
                return Html::link(
                    route('marketplace.vendor.orders.edit', $item->order->id),
                    $item->order->code . ' ' . BaseHelper::renderIcon('ti ti-external-link'),
                    ['target' => '_blank'],
                    null,
                    false
                );
            })
            ->editColumn('user_id', function ($item) {
                return BaseHelper::clean($item->order->user->name ?: $item->order->address->name);
            })
            ->editColumn('price', function ($item) {
                return format_price($item->price);
            })
            ->editColumn('cod_status', function ($item) {
                if (! (float) $item->cod_amount) {
                    return Html::tag(
                        'span',
                        trans('plugins/ecommerce::shipping.not_available'),
                        ['class' => 'label-info status-label']
                    )
                        ->toHtml();
                }

                return BaseHelper::clean($item->cod_status->toHtml());
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select([
                'id',
                'order_id',
                'user_id',
                'price',
                'status',
                'cod_status',
                'created_at',
            ])
            ->whereHas('order', function ($query): void {
                $query
                    ->where('is_finished', 1)
                    ->where('store_id', auth('customer')->user()->store?->id);
            })
            ->with(['order', 'order.user', 'order.address']);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('order_id')
                ->title(trans('plugins/ecommerce::shipping.order_id')),
            Column::make('user_id')
                ->title(trans('plugins/ecommerce::order.customer_label'))
                ->alignStart(),
            Column::make('price')
                ->title(trans('plugins/ecommerce::shipping.shipping_amount')),
            Column::make('cod_status')
                ->title(trans('plugins/ecommerce::shipping.cod_status')),
            StatusColumn::make(),
            CreatedAtColumn::make(),
        ];
    }
}
