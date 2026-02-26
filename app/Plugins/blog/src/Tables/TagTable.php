<?php

namespace App\Plugins\Blog\Tables;

use App\Plugins\Blog\Models\Tag;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class TagTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Tag::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('tags.create'))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('tags.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addActions([
                EditAction::make()->route('tags.edit'),
                DeleteAction::make()->route('tags.destroy'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('tags.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'created_at',
                        'status',
                    ]);
            });
    }
}
