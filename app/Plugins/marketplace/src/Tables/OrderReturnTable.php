<?php

namespace App\Plugins\Marketplace\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Ecommerce\Models\OrderReturn;
use App\Plugins\Marketplace\Tables\Traits\ForVendor;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\EnumColumn;
use App\Core\Table\Columns\IdColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class OrderReturnTable extends TableAbstract
{
    use ForVendor;

    public function setup(): void
    {
        $this
            ->model(OrderReturn::class)
            ->addActions([
                EditAction::make()->route('marketplace.vendor.order-returns.edit'),
                DeleteAction::make()->route('marketplace.vendor.order-returns.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('order_id', function ($item) {
                return BaseHelper::clean($item->order->code);
            })
            ->editColumn('user_id', function ($item) {
                if (! $item->customer->name) {
                    return '&mdash;';
                }

                return BaseHelper::clean($item->customer->name);
            })
            ->filter(function ($query) {
                $keyword = $this->request->input('search.value');
                if ($keyword) {
                    return $query
                        ->whereHas('items', function ($subQuery) use ($keyword) {
                            return $subQuery->where('product_name', 'LIKE', '%' . $keyword . '%');
                        })->orWhereHas('customer', function ($subQuery) use ($keyword) {
                            return $subQuery->where('name', 'LIKE', '%' . $keyword . '%');
                        });
                }

                return $query;
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this->getModel()->query()
            ->select([
                'id',
                'order_id',
                'user_id',
                'reason',
                'order_status',
                'return_status',
                'created_at',
            ])
            ->with(['customer', 'order', 'items'])
            ->withCount('items')
            ->where('store_id', auth('customer')->user()->store?->id)
            ->orderByDesc('id');

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('order_id')
                ->title(trans('plugins/ecommerce::order.order_id'))
                ->alignStart(),
            Column::make('user_id')
                ->title(trans('plugins/ecommerce::order.customer_label'))
                ->alignStart(),
            Column::make('items_count')
                ->title(trans('plugins/ecommerce::order.order_return_items_count')),
            EnumColumn::make('reason')
                ->title(trans('plugins/ecommerce::order.return_reason')),
            EnumColumn::make('return_status')
                ->title(trans('core/base::tables.status')),
            CreatedAtColumn::make(),
        ];
    }

    public function getDefaultButtons(): array
    {
        return array_unique(array_merge(['export'], parent::getDefaultButtons()));
    }
}
