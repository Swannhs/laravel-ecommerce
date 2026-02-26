<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Plugins\Ecommerce\Models\SpecificationGroup;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;

class SpecificationGroupTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SpecificationGroup::class)
            ->addHeaderAction(CreateHeaderAction::make()->route($this->getCreateRouteName()))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route($this->getEditRouteName()),
                FormattedColumn::make('description')
                    ->label(trans('core/base::forms.description'))
                    ->withEmptyState()
                    ->limit(50),
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
        return 'ecommerce.specification-groups.create';
    }

    protected function getEditRouteName(): string
    {
        return 'ecommerce.specification-groups.edit';
    }

    protected function getDeleteRouteName(): string
    {
        return 'ecommerce.specification-groups.destroy';
    }
}
