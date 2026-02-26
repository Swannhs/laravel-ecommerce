<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Plugins\Ecommerce\Models\GlobalOption;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\YesNoColumn;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;

class GlobalOptionTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(GlobalOption::class)
            ->addActions([
                EditAction::make()->route('global-option.edit'),
                DeleteAction::make()->route('global-option.destroy'),
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
                'required',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            NameColumn::make()->route('global-option.edit'),
            YesNoColumn::make('required')
                ->title(trans('plugins/ecommerce::product-option.required'))
                ->alignStart(),
            CreatedAtColumn::make(),
        ];
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('global-option.create'), 'global-option.create');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('global-option.destroy'),
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
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }
}
