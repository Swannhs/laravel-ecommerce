<?php

namespace App\Plugins\Location\Tables;

use App\Plugins\Location\Models\Country;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\BulkChanges\TextBulkChange;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class CountryTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Country::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('country.edit'),
                Column::make('nationality')
                    ->title(trans('plugins/location::country.nationality'))
                    ->alignStart(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('country.create'))
            ->addActions([
                EditAction::make()->route('country.edit'),
                DeleteAction::make()->route('country.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('country.destroy'))
            ->addBulkChanges([
                TextBulkChange::make()
                    ->name('nationality')
                    ->title(trans('plugins/location::country.nationality')),
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'nationality',
                        'created_at',
                        'status',
                    ]);
            });
    }
}
