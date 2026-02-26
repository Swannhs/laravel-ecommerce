<?php

namespace App\Plugins\Newsletter\Tables;

use App\Plugins\Newsletter\Models\Newsletter;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\EmailBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\EmailColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;

class NewsletterTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Newsletter::class)
            ->addColumns([
                IdColumn::make(),
                EmailColumn::make()->linkable(),
                NameColumn::make(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addActions([
                DeleteAction::make()->route('newsletter.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('newsletter.destroy'))
            ->addBulkChanges([
                NameBulkChange::make(),
                EmailBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'email',
                        'name',
                        'created_at',
                        'status',
                    ]);
            });
    }

    public function getDefaultButtons(): array
    {
        return array_unique(array_merge(['export'], parent::getDefaultButtons()));
    }
}
