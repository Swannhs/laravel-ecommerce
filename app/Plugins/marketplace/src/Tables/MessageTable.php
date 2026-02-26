<?php

namespace App\Plugins\Marketplace\Tables;

use App\Plugins\Marketplace\Models\Message;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\Action;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\ViewAction;
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

class MessageTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Message::class)
            ->addActions([
                ViewAction::make()
                    ->url(fn (Action $action) => route('marketplace.messages.show', $action->getItem())),
                DeleteAction::make()->route('marketplace.messages.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('marketplace.messages.show'),
                EmailColumn::make()->linkable(),
                FormattedColumn::make('content')->limit(50)->label(trans('plugins/marketplace::store.forms.content')),
                CreatedAtColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('marketplace.messages.destroy'),
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
                        'customer_id',
                        'store_id',
                    ]);
            });
    }
}
