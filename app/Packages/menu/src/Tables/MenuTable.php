<?php

namespace App\Packages\Menu\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Packages\Menu\Facades\Menu as MenuFacade;
use App\Packages\Menu\Models\Menu;
use App\Packages\Menu\Models\MenuLocation;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Arr;

class MenuTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Menu::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('menus.edit'),
                FormattedColumn::make('locations_display')
                    ->label(trans('packages/menu::menu.locations'))
                    ->orderable(false)
                    ->searchable(false)
                    ->getValueUsing(function (FormattedColumn $column) {
                        $locations = $column
                            ->getItem()
                            ->locations
                            ->sortBy('name')
                            ->map(function (MenuLocation $location) {
                                $locationName = Arr::get(MenuFacade::getMenuLocations(), $location->location);

                                if (! $locationName) {
                                    return null;
                                }

                                return BaseHelper::renderBadge($locationName, 'info', ['class' => 'me-1']);
                            })
                            ->all();

                        return implode(', ', $locations);
                    })
                    ->withEmptyState(),
                FormattedColumn::make('items_count')
                    ->label(trans('packages/menu::menu.items'))
                    ->orderable(false)
                    ->searchable(false)
                    ->getValueUsing(function (FormattedColumn $column) {
                        return BaseHelper::renderIcon('ti ti-link') . ' '
                            . number_format($column->getItem()->menu_nodes_count);
                    }),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('menus.create'))
            ->addActions([
                EditAction::make()->route('menus.edit'),
                DeleteAction::make()->route('menus.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('menus.destroy'))
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query): void {
                $query
                    ->select([
                        'id',
                        'name',
                        'created_at',
                        'status',
                    ])
                    ->with('locations')
                    ->withCount('menuNodes');
            });
    }
}
