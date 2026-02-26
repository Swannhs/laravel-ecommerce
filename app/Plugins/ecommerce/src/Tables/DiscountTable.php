<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Plugins\Ecommerce\Enums\DiscountTypeEnum;
use App\Plugins\Ecommerce\Models\Discount;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\DateColumn;
use App\Core\Table\Columns\IdColumn;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class DiscountTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Discount::class)
            ->addActions([
                EditAction::make()->route('discounts.edit'),
                DeleteAction::make()->route('discounts.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('detail', function (Discount $item) {
                $isCoupon = $item->type == DiscountTypeEnum::COUPON;

                return view('plugins/ecommerce::discounts.detail', compact('item', 'isCoupon'))->render();
            })
            ->editColumn('total_used', function (Discount $item) {
                if ($item->type == DiscountTypeEnum::PROMOTION) {
                    return '&mdash;';
                }

                if ($item->quantity === null) {
                    return number_format($item->total_used);
                }

                return sprintf('%d/%d', number_format($item->total_used), number_format($item->quantity));
            });

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select(['*']);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('detail')
                ->name('code')
                ->title(trans('plugins/ecommerce::discount.detail'))
                ->alignStart(),
            Column::make('total_used')
                ->title(trans('plugins/ecommerce::discount.used'))
                ->width(100),
            DateColumn::make('start_date')
                ->title(trans('plugins/ecommerce::discount.start_date')),
            DateColumn::make('end_date')
                ->title(trans('plugins/ecommerce::discount.end_date')),
        ];
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('discounts.create'), 'discounts.create');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('discounts.destroy'),
        ];
    }

    public function renderTable($data = [], $mergeData = []): View|Factory|Response
    {
        if ($this->isEmpty()) {
            return view('plugins/ecommerce::discounts.intro');
        }

        return parent::renderTable($data, $mergeData);
    }
}
