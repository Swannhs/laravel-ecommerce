<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Plugins\Ecommerce\Models\SpecificationTable;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class SpecificationTableTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SpecificationTable::class)
            ->queryUsing(fn (Builder $query) => $query->withCount('groups'))
            ->addHeaderAction(CreateHeaderAction::make()->route($this->getCreateRouteName()))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route($this->getEditRouteName()),
                FormattedColumn::make('description')
                    ->label(trans('core/base::forms.description'))
                    ->withEmptyState()
                    ->limit(50),
                FormattedColumn::make('tables')
                    ->orderable(false)
                    ->searchable(false)
                    ->label(trans('plugins/ecommerce::product-specification.specification_tables.fields.assigned_groups'))
                    ->getValueUsing(fn (FormattedColumn $column) => $column->getItem()->groups_count),
                CreatedAtColumn::make(),
            ])
            ->addBulkAction(DeleteBulkAction::make())
            ->addActions([
                EditAction::make()->route($this->getEditRouteName()),
                DeleteAction::make()->route($this->getDeleteRouteName()),
            ]);
    }

    protected function getCreateRouteName(): string
    {
        return 'ecommerce.specification-tables.create';
    }

    protected function getEditRouteName(): string
    {
        return 'ecommerce.specification-tables.edit';
    }

    protected function getDeleteRouteName(): string
    {
        return 'ecommerce.specification-tables.destroy';
    }
}
