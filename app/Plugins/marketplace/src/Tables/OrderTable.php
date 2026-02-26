<?php

namespace App\Plugins\Marketplace\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Order;
use App\Plugins\Ecommerce\Tables\Formatters\PriceFormatter;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Tables\Traits\ForVendor;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class OrderTable extends TableAbstract
{
    use ForVendor;

    public function setup(): void
    {
        $this
            ->model(Order::class)
            ->addActions(array_filter([
                EditAction::make()->route('marketplace.vendor.orders.edit'),
                EcommerceHelper::isOrderDeletionEnabled() && MarketplaceHelper::allowVendorDeleteTheirOrders()
                    ? DeleteAction::make()->route('marketplace.vendor.orders.destroy')
                    : null,
            ]));
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('payment_status', function (Order $item) {
                if (! is_plugin_active('payment')) {
                    return '&mdash;';
                }

                return $item->payment->status->label() ? BaseHelper::clean(
                    $item->payment->status->toHtml()
                ) : '&mdash;';
            })
            ->editColumn('payment_method', function (Order $item) {
                if (! is_plugin_active('payment')) {
                    return '&mdash;';
                }

                return BaseHelper::clean($item->payment->payment_channel->displayName() ?: '&mdash;');
            })
            ->formatColumn('amount', PriceFormatter::class)
            ->formatColumn('shipping_amount', PriceFormatter::class);

        if (EcommerceHelper::isTaxEnabled()) {
            $data = $data->editColumn('tax_amount', function ($item) {
                return format_price($item->tax_amount);
            });
        }

        $data = $data
            ->filter(function ($query) {
                return $query->searchByKeyword($this->request->input('search.value'));
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $with = ['user'];

        if (is_plugin_active('payment')) {
            $with[] = 'payment';
        }

        $query = $this
            ->getModel()
            ->query()
            ->with($with)
            ->select([
                'id',
                'status',
                'user_id',
                'created_at',
                'amount',
                'tax_amount',
                'shipping_amount',
                'payment_id',
            ])
            ->where('is_finished', 1)
            ->where('store_id', auth('customer')->user()->store?->id);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        $columns = [
            IdColumn::make(),
            FormattedColumn::make('user_id')
                ->title(trans('plugins/ecommerce::order.email'))
                ->alignStart()
                ->orderable(false)
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem();

                    return sprintf(
                        '%s <br> %s <br> %s',
                        $item->user->name ?: $item->address->name,
                        $item->user->email ?: $item->address->email,
                        $item->user->phone ?: $item->address->phone
                    );
                }),
            Column::formatted('amount')
                ->title(trans('plugins/ecommerce::order.amount')),
        ];

        if (EcommerceHelper::isTaxEnabled()) {
            $columns[] = Column::make('tax_amount')
                ->title(trans('plugins/ecommerce::order.tax_amount'));
        }

        $columns = array_merge($columns, [
            Column::formatted('shipping_amount')
                ->title(trans('plugins/ecommerce::order.shipping_amount')),
        ]);

        if (is_plugin_active('payment')) {
            $columns = array_merge($columns, [
                Column::make('payment_method')
                    ->name('payment_id')
                    ->title(trans('plugins/ecommerce::order.payment_method'))
                    ->alignStart(),
                Column::make('payment_status')
                    ->name('payment_id')
                    ->title(trans('plugins/ecommerce::order.payment_status_label')),
            ]);
        }

        return array_merge($columns, [
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ]);
    }

    public function getDefaultButtons(): array
    {
        return array_unique(array_merge(['export'], parent::getDefaultButtons()));
    }
}
