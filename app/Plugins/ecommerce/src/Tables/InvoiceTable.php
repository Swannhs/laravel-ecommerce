<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Plugins\Ecommerce\Models\Invoice;
use App\Plugins\Ecommerce\Tables\Formatters\PriceFormatter;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\LinkableColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class InvoiceTable extends TableAbstract
{
    public function setup(): void
    {
        Assets::addScriptsDirectly('vendor/core/plugins/ecommerce/js/invoice.js');
        $this
            ->model(Invoice::class)
            ->addActions([
                EditAction::make()->route('ecommerce.invoice.edit'),
                DeleteAction::make()->route('ecommerce.invoice.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->formatColumn('amount', PriceFormatter::class)
            ->editColumn('reference_id', function (Invoice $item) {
                if (! $item->reference || ! $item->reference->id) {
                    return '&mdash;';
                }

                return Html::link(route('orders.edit', $item->reference->id), $item->reference->code)->toHtml();
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
                'customer_name',
                'code',
                'reference_id',
                'reference_type',
                'amount',
                'created_at',
                'updated_at',
                'status',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('customer_name')
                ->title(trans('core/base::tables.name'))
                ->alignStart(),
            Column::make('reference_id')
                ->title(trans('plugins/ecommerce::invoice.order'))
                ->alignStart(),
            LinkableColumn::make('code')
                ->title(trans('plugins/ecommerce::invoice.table.code'))
                ->route('ecommerce.invoice.edit')
                ->alignStart(),
            Column::formatted('amount')
                ->title(trans('plugins/ecommerce::invoice.table.amount'))
                ->alignStart(),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function buttons(): array
    {
        $buttons = [];

        if ($this->hasPermission('ecommerce.invoice.edit')) {
            $buttons['generate-invoices'] = [
                'text' => BaseHelper::renderIcon('ti ti-file-export')
                    . trans('plugins/ecommerce::invoice.generate_invoices')
                    . '<span class="d-none" data-trigger data-url="' . route('ecommerce.invoice.generate-invoices') . '"></span>',
                'class' => 'btn-primary invoice-generate',
            ];
        }

        return $buttons;
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('ecommerce.invoice.destroy'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            'customer_name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'status' => [
                'title' => trans('core/base::tables.status'),
                'type' => 'select',
                'choices' => BaseStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }
}
