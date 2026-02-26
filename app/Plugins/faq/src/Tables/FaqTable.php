<?php

namespace App\Plugins\Faq\Tables;

use App\Plugins\Faq\Models\Faq;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\TextBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\LinkableColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class FaqTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Faq::class)
            ->addColumns([
                IdColumn::make(),
                LinkableColumn::make('question')
                    ->title(trans('plugins/faq::faq.question'))
                    ->route('faq.edit')
                    ->alignStart(),
                FormattedColumn::make('category_id')
                    ->title(trans('plugins/faq::faq.category'))
                    ->alignStart()
                    ->withEmptyState()
                    ->getValueUsing(fn (FormattedColumn $column) => $column->getItem()->category->name),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('faq.create'))
            ->addActions([
                EditAction::make()->route('faq.edit'),
                DeleteAction::make()->route('faq.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('faq.destroy'))
            ->addBulkChanges([
                TextBulkChange::make()
                    ->name('question')
                    ->title(trans('plugins/faq::faq.question')),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'question',
                        'created_at',
                        'answer',
                        'category_id',
                        'status',
                    ]);
            });
    }
}
