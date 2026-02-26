<?php

namespace App\Plugins\Location\Tables;

use App\Core\Base\Facades\Html;
use App\Plugins\Location\Models\Country;
use App\Plugins\Location\Models\State;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\SelectBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class StateTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(State::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('state.edit'),
                Column::make('country_id')
                    ->title(trans('plugins/location::state.country'))
                    ->alignStart(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('state.create'))
            ->addActions([
                EditAction::make()->route('state.edit'),
                DeleteAction::make()->route('state.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('state.destroy'))
            ->addBulkChanges([
                NameBulkChange::make(),
                SelectBulkChange::make()
                    ->name('country_id')
                    ->title(trans('plugins/location::city.country'))
                    ->searchable()
                    ->choices(fn () => Country::query()->pluck('name', 'id')->all()),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'country_id',
                        'created_at',
                        'status',
                    ]);
            })
            ->onAjax(function () {
                $data = $this->table
                    ->eloquent($this->query())
                    ->editColumn('country_id', function (State $item) {
                        if (! $item->country_id && $item->country->name) {
                            return null;
                        }

                        return Html::link(route('country.edit', $item->country_id), $item->country->name);
                    })
                    ->filter(function (Builder $query) {
                        $keyword = $this->request->input('search.value');

                        if (! $keyword) {
                            return $query;
                        }

                        return $query->where(function (Builder $query) use ($keyword): void {
                            $query
                                ->where('id', $keyword)
                                ->orWhere('name', 'LIKE', '%' . $keyword . '%')
                                ->orWhereHas('country', function (Builder $subQuery) use ($keyword) {
                                    return $subQuery
                                        ->where('name', 'LIKE', '%' . $keyword . '%');
                                });
                        });
                    });

                return $this->toJson($data);
            });
    }
}
