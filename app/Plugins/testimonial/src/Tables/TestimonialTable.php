<?php

namespace App\Plugins\Testimonial\Tables;

use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\ImageColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use App\Plugins\Testimonial\Models\Testimonial;
use Illuminate\Database\Eloquent\Builder;

class TestimonialTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Testimonial::class)
            ->addColumns([
                IdColumn::make(),
                ImageColumn::make(),
                NameColumn::make()->route('testimonial.edit'),
                CreatedAtColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('testimonial.create'))
            ->addActions([
                EditAction::make()->route('testimonial.edit'),
                DeleteAction::make()->route('testimonial.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('testimonial.destroy'))
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
                        'image',
                    ]);
            });
    }
}
