<?php

namespace App\Plugins\Faq\Tables;

use App\Plugins\Faq\Models\FaqCategory;
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

class FaqCategoryTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(FaqCategory::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('faq_category.edit'),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('faq_category.create'))
            ->addActions([
                EditAction::make()->route('faq_category.edit'),
                DeleteAction::make()->route('faq_category.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('faq_category.destroy'))
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
