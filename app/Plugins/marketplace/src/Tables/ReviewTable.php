<?php

namespace App\Plugins\Marketplace\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Core\Base\Models\BaseQueryBuilder;
use App\Plugins\Ecommerce\Models\Review;
use App\Plugins\Ecommerce\Tables\Formatters\ReviewImagesFormatter;
use App\Plugins\Marketplace\Tables\Traits\ForVendor;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class ReviewTable extends TableAbstract
{
    use ForVendor;

    protected $hasOperations = false;

    public function setup(): void
    {
        $this
            ->model(Review::class)
            ->addActions([]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('product_id', function (Review $item) {
                if (! empty($item->product)) {
                    return Html::link(
                        $item->product->url,
                        BaseHelper::clean($item->product->name),
                        ['target' => '_blank']
                    );
                }

                return null;
            })
            ->editColumn('customer_id', function (Review $item) {
                return BaseHelper::clean($item->user->name);
            })
            ->editColumn('star', function ($item) {
                return view('plugins/ecommerce::reviews.partials.rating', ['star' => $item->star])->render();
            })
            ->formatColumn('images', ReviewImagesFormatter::class);

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select([
                'id',
                'star',
                'comment',
                'product_id',
                'customer_id',
                'status',
                'created_at',
                'images',
            ])
            ->with(['user', 'product'])
            ->wherePublished()
            ->whereHas('product', function (BaseQueryBuilder $query): void {
                $query
                    ->wherePublished()
                    ->where('store_id', auth('customer')->user()->store?->id);
            });

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('product_id')
                ->title(trans('plugins/ecommerce::review.product'))
                ->alignStart(),
            Column::make('customer_id')
                ->title(trans('plugins/ecommerce::review.user'))
                ->alignStart(),
            Column::make('star')
                ->title(trans('plugins/ecommerce::review.star')),
            Column::make('comment')
                ->title(trans('plugins/ecommerce::review.comment'))
                ->alignStart(),
            Column::formatted('images')
                ->title(trans('plugins/ecommerce::review.images'))
                ->width(150)
                ->orderable(false)
                ->searchable(false)
                ->alignStart(),
            CreatedAtColumn::make(),
        ];
    }
}
