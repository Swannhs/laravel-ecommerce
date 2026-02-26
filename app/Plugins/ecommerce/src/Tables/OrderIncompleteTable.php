<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Ecommerce\Models\Order;
use App\Plugins\Ecommerce\Tables\Formatters\PriceFormatter;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\ViewAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Arr;
use Symfony\Component\HttpFoundation\Response;

class OrderIncompleteTable extends OrderTable
{
    public function setup(): void
    {
        $this
            ->model(Order::class)
            ->addActions([
                ViewAction::make()
                    ->route('orders.view-incomplete-order')
                    ->permission('orders.edit'),
                DeleteAction::make()->route('orders.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->formatColumn('amount', PriceFormatter::class)
            ->editColumn('user_id', function (Order $item) {
                return BaseHelper::clean($item->user->name ?: $item->address->name);
            })
            ->filter(function ($query) {
                return $this->filterOrders($query, false);
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this->getModel()
            ->query()
            ->select([
                'id',
                'user_id',
                'created_at',
                'amount',
            ])
            ->with(['user'])
            ->where('is_finished', 0);

        return $this->applyScopes($query);
    }

    public function renderTable($data = [], $mergeData = []): View|Factory|Response
    {
        if ($this->isEmpty()) {
            return view('plugins/ecommerce::orders.incomplete-intro');
        }

        return parent::renderTable($data, $mergeData);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('user_id')
                ->title(trans('plugins/ecommerce::order.customer_label'))
                ->alignStart(),
            Column::formatted('amount')
                ->title(trans('plugins/ecommerce::order.amount')),
            CreatedAtColumn::make(),
        ];
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('orders.destroy'),
        ];
    }

    public function getFilters(): array
    {
        $filters = parent::getFilters();

        Arr::forget($filters, ['payment_method', 'payment_status', 'shipping_method']);

        return $filters;
    }
}
