<?php

namespace App\Plugins\Contact\Tables;

use App\Plugins\Contact\Enums\ContactStatusEnum;
use App\Plugins\Contact\Exports\ContactExport;
use App\Plugins\Contact\Models\Contact;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\EmailBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\PhoneBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\EmailColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\PhoneColumn;
use App\Core\Table\Columns\StatusColumn;
use Illuminate\Database\Eloquent\Builder;

class ContactTable extends TableAbstract
{
    protected string $exportClass = ContactExport::class;

    public function setup(): void
    {
        $this
            ->model(Contact::class)
            ->addActions([
                EditAction::make()->route('contacts.edit'),
                DeleteAction::make()->route('contacts.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('contacts.edit'),
                EmailColumn::make()->linkable()->withEmptyState(),
                PhoneColumn::make()->linkable()->withEmptyState(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('contacts.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                EmailBulkChange::make(),
                StatusBulkChange::make()->choices(ContactStatusEnum::labels()),
                CreatedAtBulkChange::make(),
                PhoneBulkChange::make()->title(trans('plugins/contact::contact.sender_phone')),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'phone',
                        'email',
                        'created_at',
                        'status',
                    ]);
            });
    }

    public function getDefaultButtons(): array
    {
        return array_unique(array_merge(['export'], parent::getDefaultButtons()));
    }
}
