<?php

namespace App\Plugins\Contact\Tables;

use App\Plugins\Contact\Models\CustomField;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\EnumColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class CustomFieldTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(CustomField::class)
            ->addHeaderActions([
                CreateHeaderAction::make()->route('contacts.custom-fields.create')->permission('contacts.edit'),
            ])
            ->addBulkChanges([
                NameBulkChange::make()->validate('required|max:120'),
                CreatedAtBulkChange::make(),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('contacts.edit'))
            ->addActions([
                EditAction::make()->route('contacts.custom-fields.edit')->permission('contacts.edit'),
                DeleteAction::make()->route('contacts.custom-fields.destroy')->permission('contacts.edit'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('contacts.custom-fields.edit')->permission('contacts.edit'),
                EnumColumn::make('type')
                    ->title(trans('plugins/contact::contact.custom_field.type'))
                    ->alignLeft(),
                CreatedAtColumn::make(),
            ])
            ->queryUsing(fn (Builder $query) => $query->select([
                'id',
                'name',
                'type',
                'created_at',
            ]));
    }
}
