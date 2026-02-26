<?php

namespace App\Plugins\Marketplace\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Plugins\Marketplace\Models\Vendor;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\ViewAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;

class UnverifiedVendorTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Vendor::class)
            ->addActions([
                ViewAction::make()
                    ->route('marketplace.unverified-vendors.view')
                    ->permission('marketplace.unverified-vendors.index'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('avatar', function (Vendor $item) {
                if ($this->request()->input('action') == 'excel' ||
                    $this->request()->input('action') == 'csv') {
                    return $item->avatar_url;
                }

                return Html::tag('img', '', ['src' => $item->avatar_url, 'alt' => BaseHelper::clean($item->name), 'width' => 50]);
            })
            ->editColumn('store_name', function (Vendor $item) {
                return $item->store->name ? BaseHelper::clean($item->store->name) : '&mdash;';
            })
            ->editColumn('store_phone', function (Vendor $item) {
                return $item->store->phone ? BaseHelper::clean($item->store->phone) : '&mdash;';
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
                'name',
                'created_at',
                'is_vendor',
                'avatar',
                'vendor_verified_at',
            ])
            ->unverified()
            ->with(['store']);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            Column::make('avatar')
                ->title(trans('plugins/ecommerce::customer.avatar'))
                ->width(70),
            NameColumn::make()
                ->route('marketplace.unverified-vendors.view')
                ->permission('marketplace.unverified-vendors.edit'),
            Column::make('store_name')
                ->title(trans('plugins/marketplace::unverified-vendor.forms.store_name'))
                ->alignStart()
                ->orderable(false)
                ->searchable(false),
            Column::make('store_phone')
                ->title(trans('plugins/marketplace::unverified-vendor.forms.store_phone'))
                ->alignStart()
                ->orderable(false)
                ->searchable(false),
            CreatedAtColumn::make(),
        ];
    }
}
