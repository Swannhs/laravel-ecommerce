<?php

namespace App\Packages\Api\Tables;

use App\Packages\Api\Models\PersonalAccessToken;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\DateTimeColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class SanctumTokenTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->setView('packages/api::table')
            ->model(PersonalAccessToken::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('api.sanctum-token.create'))
            ->addAction(DeleteAction::make()->route('api.sanctum-token.destroy'))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make(),
                Column::make('abilities')
                    ->label(trans('packages/api::sanctum-token.abilities')),
                DateTimeColumn::make('last_used_at')
                    ->label(trans('packages/api::sanctum-token.last_used_at')),
                CreatedAtColumn::make(),
            ])
            ->addBulkAction(DeleteBulkAction::make())
            ->queryUsing(fn (Builder $query) => $query->select([
                'id',
                'name',
                'abilities',
                'last_used_at',
                'created_at',
            ]));
    }
}
