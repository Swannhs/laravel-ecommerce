<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Plugins\Ecommerce\Models\ProductTag;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;

class ProductTagTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(ProductTag::class)
            ->addActions([
                EditAction::make()->route('product-tag.edit'),
                DeleteAction::make()->route('product-tag.destroy'),
            ]);
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
                'status',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            NameColumn::make()->route('product-tag.edit'),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('product-tag.create'), 'product-tag.create');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('product-tag.destroy'),
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
