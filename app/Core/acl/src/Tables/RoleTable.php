<?php

namespace App\Core\ACL\Tables;

use App\Core\ACL\Models\Role;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\LinkableColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class RoleTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Role::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('roles.edit'),
                FormattedColumn::make('description')
                    ->title(trans('core/base::tables.description'))
                    ->alignStart()
                    ->withEmptyState(),
                CreatedAtColumn::make(),
                LinkableColumn::make('created_by')
                    ->urlUsing(fn (LinkableColumn $column) => $column->getItem()->author->url)
                    ->title(trans('core/acl::permissions.created_by'))
                    ->width(100)
                    ->getValueUsing(function (LinkableColumn $column) {
                        return BaseHelper::clean($column->getItem()->author->name);
                    })
                    ->externalLink()
                    ->withEmptyState(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('roles.create'))
            ->addActions([
                EditAction::make()->route('roles.edit'),
                DeleteAction::make()->route('roles.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('roles.destroy'))
            ->addBulkChange(NameBulkChange::make())
            ->queryUsing(function (Builder $query): void {
                $query
                    ->with('author')
                    ->select([
                        'id',
                        'name',
                        'description',
                        'created_at',
                        'created_by',
                    ]);
            });
    }
}
