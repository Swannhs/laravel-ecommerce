<?php

namespace App\Plugins\Marketplace\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Plugins\Ecommerce\Enums\CustomerStatusEnum;
use App\Plugins\Marketplace\Models\Vendor;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\Actions\ViewAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\EmailBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\EmailColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\Columns\YesNoColumn;
use Illuminate\Database\Eloquent\Builder;

class VendorTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Vendor::class)
            ->addActions([
                ViewAction::make()
                    ->route('marketplace.vendors.view')
                    ->permission('marketplace.vendors.index'),
                EditAction::make()->route('customers.edit'),
                DeleteAction::make()->route('customers.destroy'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('customers.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                EmailBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select('ec_customers.*')
                    ->withStatistics()
                    ->with(['store']);
            });
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            FormattedColumn::make('avatar')
                ->title(trans('plugins/ecommerce::customer.avatar'))
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem();

                    if ($this->isExportingToCSV() || $this->isExportingToExcel()) {
                        return $item->avatar_url;
                    }

                    return Html::tag(
                        'img',
                        '',
                        ['src' => $item->avatar_url, 'alt' => BaseHelper::clean($item->name), 'width' => 50, 'height' => 50, 'class' => 'rounded']
                    );
                }),
            NameColumn::make()
                ->route('marketplace.vendors.view')
                ->permission('marketplace.vendors.index'),
            EmailColumn::make(),
            FormattedColumn::make('store_name')
                ->title(trans('plugins/marketplace::marketplace.store_name'))
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem();

                    if (! $item->store) {
                        return '—';
                    }

                    return Html::link(
                        route('marketplace.store.edit', $item->store->id),
                        BaseHelper::clean($item->store->name),
                        ['target' => '_blank']
                    );
                })
                ->orderable(false)
                ->searchable(false),
            FormattedColumn::make('store_phone')
                ->title(trans('plugins/marketplace::marketplace.store_phone'))
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem();

                    return $item->store ? $item->store->phone : '—';
                })
                ->orderable(false)
                ->searchable(false),
            FormattedColumn::make('products_count')
                ->title(trans('plugins/marketplace::marketplace.products_count'))
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem();
                    $count = $item->products_count ?? 0;

                    return Html::tag('span', number_format($count), ['class' => 'badge bg-blue text-blue-fg']);
                })
                ->orderable(false)
                ->searchable(false),
            FormattedColumn::make('total_revenue')
                ->title(trans('plugins/marketplace::marketplace.total_revenue'))
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem();
                    $revenue = $item->total_revenue ?? 0;

                    return format_price($revenue);
                })
                ->orderable(false)
                ->searchable(false),
            FormattedColumn::make('balance')
                ->title(trans('plugins/marketplace::marketplace.balance'))
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem();

                    $earnings = $item->total_earnings ?? 0;
                    $withdrawals = $item->total_withdrawals ?? 0;
                    $balance = $earnings - $withdrawals;

                    $class = $balance > 0 ? 'bg-green text-green-fg' : ($balance < 0 ? 'bg-red text-red-fg' : 'bg-cyan text-cyan-fg');

                    return Html::tag('span', format_price($balance), ['class' => 'badge ' . $class]);
                })
                ->orderable(false)
                ->searchable(false),
            YesNoColumn::make('vendor_verified_at')
                ->title(trans('plugins/marketplace::marketplace.verified'))
                ->alignCenter(),
            FormattedColumn::make('store_status')
                ->title(trans('plugins/marketplace::marketplace.store_status'))
                ->renderUsing(function (FormattedColumn $column) {
                    $item = $column->getItem();
                    $status = $item->store_status;

                    if (! $status) {
                        return '—';
                    }

                    return BaseHelper::clean($status->toHtml());
                })
                ->orderable(false)
                ->searchable(false),
            StatusColumn::make(),
            CreatedAtColumn::make(),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'email' => [
                'title' => trans('core/base::tables.email'),
                'type' => 'text',
                'validate' => 'required|max:120|email',
            ],
            'status' => [
                'title' => trans('core/base::tables.status'),
                'type' => 'select',
                'choices' => CustomerStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', CustomerStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'date',
            ],
        ];
    }

    public function getFilters(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::forms.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'email' => [
                'title' => trans('core/base::tables.email'),
                'type' => 'text',
                'validate' => 'required|max:120|email',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'date',
            ],
            'vendor_verified_at' => [
                'title' => trans('plugins/marketplace::marketplace.verified'),
                'type' => 'select',
                'choices' => [
                    1 => trans('core/base::base.yes'),
                    0 => trans('core/base::base.no'),
                ],
                'validate' => 'required|in:0,1',
            ],
        ];
    }

    public function getDefaultButtons(): array
    {
        return [
            'export',
            'reload',
        ];
    }
}
