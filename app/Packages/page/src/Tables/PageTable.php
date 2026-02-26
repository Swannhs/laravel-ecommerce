<?php

namespace App\Packages\Page\Tables;

use App\Packages\Page\Models\Page;
use App\Packages\Page\Supports\Template;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\SelectBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Contracts\Database\Eloquent\Builder;
use Illuminate\Support\Arr;

class PageTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Page::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('pages.create'))
            ->addActions([
                EditAction::make()->route('pages.edit'),
                DeleteAction::make()->route('pages.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('pages.edit'),
                FormattedColumn::make('template')
                    ->title(trans('core/base::tables.template'))
                    ->alignStart()
                    ->getValueUsing(function (FormattedColumn $column) {
                        static $pageTemplates;

                        $pageTemplates ??= Template::getPageTemplates();

                        return Arr::get($pageTemplates, $column->getItem()->template ?: 'default');
                    }),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('pages.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                SelectBulkChange::make()
                    ->name('template')
                    ->title(trans('core/base::tables.template'))
                    ->choices(fn () => Template::getPageTemplates()),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query): void {
                $query->select([
                    'id',
                    'name',
                    'template',
                    'created_at',
                    'status',
                ]);
            });
    }
}
