<?php

namespace App\Plugins\Marketplace\Tables;

use App\Plugins\Marketplace\Models\Message;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\EmailBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\EmailColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use Illuminate\Database\Eloquent\Builder;

class AdminMessageTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Message::class)
            ->addActions([
                EditAction::make()->route('marketplace.admin.messages.edit'),
                DeleteAction::make()->route('marketplace.admin.messages.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('marketplace.admin.messages.edit'),
                EmailColumn::make()->linkable(),
                FormattedColumn::make('content')->limit(50),
                CreatedAtColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('marketplace.admin.messages.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                EmailBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'email',
                        'content',
                        'created_at',
                    ])
                    ->with(['store', 'customer']);
            });
    }

    public function getDefaultButtons(): array
    {
        return array_unique(array_merge(['export'], parent::getDefaultButtons()));
    }
}
