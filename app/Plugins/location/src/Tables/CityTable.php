<?php

namespace App\Plugins\Location\Tables;

use App\Core\Base\Facades\Html;
use App\Plugins\Location\Models\City;
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

class CityTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(City::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('city.edit'),
                Column::make('state_id')
                    ->title(trans('plugins/location::city.state'))
                    ->alignStart(),
                Column::make('country_id')
                    ->title(trans('plugins/location::city.country'))
                    ->alignStart(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('city.create'))
            ->addActions([
                EditAction::make()->route('city.edit'),
                DeleteAction::make()->route('city.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('city.destroy'))
            ->addBulkChanges([
                NameBulkChange::make(),
                SelectBulkChange::make()
                    ->name('state_id')
                    ->title(trans('plugins/location::city.state'))
                    ->searchable()
                    ->choices(fn () => State::query()->pluck('name', 'id')->all()),
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
                        'state_id',
                        'country_id',
                        'created_at',
                        'status',
                    ]);
            })
            ->onAjax(function () {
                $data = $this->table
                    ->eloquent($this->query())
                    ->editColumn('state_id', function (City $item) {
                        if (! $item->state_id || ! $item->state->name) {
                            return '&mdash;';
                        }

                        return Html::link(route('state.edit', $item->state_id), $item->state->name);
                    })
                    ->editColumn('country_id', function (City $item) {
                        if (! $item->country_id || ! $item->country->name) {
                            return '&mdash;';
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
                                ->orWhereHas('state', function (Builder $subQuery) use ($keyword) {
                                    return $subQuery
                                        ->where('name', 'LIKE', '%' . $keyword . '%');
                                })
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
