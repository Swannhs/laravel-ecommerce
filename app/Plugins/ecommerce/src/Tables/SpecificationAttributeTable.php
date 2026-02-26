<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Plugins\Ecommerce\Models\SpecificationAttribute;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\LinkableColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class SpecificationAttributeTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SpecificationAttribute::class)
            ->addHeaderAction(CreateHeaderAction::make()->route($this->getCreateRouteName()))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route($this->getEditRouteName()),
                LinkableColumn::make('group_id')
                    ->label(trans('plugins/ecommerce::product-specification.specification_attributes.group'))
                    ->externalLink()
                    ->getValueUsing(function (FormattedColumn $column) {
                        $item = $column->getItem();

                        return $item->group ? $item->group->name : '—';
                    })
                    ->urlUsing(function (FormattedColumn $column) {
                        $item = $column->getItem();

                        return $item->group ? route('ecommerce.specification-groups.edit', $item->group->id) : null;
                    }),
                FormattedColumn::make('type')
                    ->label(trans('plugins/ecommerce::product-specification.specification_attributes.type'))
                    ->renderUsing(function (FormattedColumn $column) {
                        return $column->getItem()->type->label();
                    }),
                CreatedAtColumn::make(),
            ])
            ->addBulkAction(DeleteBulkAction::make())
            ->addActions([
                EditAction::make()->route($this->getEditRouteName()),
                DeleteAction::make()->route($this->getDeleteRouteName()),
            ])
            ->queryUsing(function (Builder $query) {
                return $query->with('group');
            });
    }

    protected function getCreateRouteName(): string
    {
        return 'ecommerce.specification-attributes.create';
    }

    protected function getEditRouteName(): string
    {
        return 'ecommerce.specification-attributes.edit';
    }

    protected function getDeleteRouteName(): string
    {
        return 'ecommerce.specification-attributes.destroy';
    }
}
