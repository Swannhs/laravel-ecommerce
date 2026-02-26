<?php

namespace App\Plugins\Marketplace\Tables\Fronts;

use App\Plugins\Marketplace\Models\Message;
use App\Plugins\Marketplace\Tables\Traits\ForVendor;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\Action;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\ViewAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\EmailColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use Illuminate\Database\Eloquent\Builder;

class MessageTable extends TableAbstract
{
    use ForVendor;

    public function setup(): void
    {
        $this
            ->model(Message::class)
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('marketplace.vendor.messages.show'),
                EmailColumn::make()->linkable(),
                FormattedColumn::make('content')->limit(50)->label(trans('plugins/marketplace::store.forms.content')),
                CreatedAtColumn::make(),
            ])
            ->addActions([
                ViewAction::make()
                    ->url(fn (Action $action) => route('marketplace.vendor.messages.show', $action->getItem())),
                DeleteAction::make()
                    ->url(fn (Action $action) => route('marketplace.vendor.messages.destroy', $action->getItem())),
            ])
            ->addBulkAction(DeleteBulkAction::make())
            ->queryUsing(function (Builder $query) {
                return $query->where('store_id', auth('customer')->user()->store?->id);
            });
    }
}
