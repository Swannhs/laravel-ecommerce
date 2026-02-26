<?php

namespace App\Plugins\Payment\Tables;

use App\Plugins\Payment\Models\PaymentLog;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\ViewAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\DateTimeColumn;
use App\Core\Table\Columns\EnumColumn;
use App\Core\Table\Columns\IdColumn;
use Illuminate\Database\Eloquent\Builder;

class PaymentLogTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(PaymentLog::class)
            ->addActions([
                ViewAction::make()
                    ->route('payments.logs.show'),
                DeleteAction::make()->route('payments.logs.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                EnumColumn::make('payment_method'),
                Column::make('ip_address'),
                DateTimeColumn::make('created_at'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('payments.logs.destroy'),
            ])
            ->queryUsing(
                fn (Builder $query) => $query->select(['id', 'payment_method', 'request', 'ip_address', 'created_at'])
            );
    }
}
