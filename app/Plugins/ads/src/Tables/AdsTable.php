<?php

namespace App\Plugins\Ads\Tables;

use App\Plugins\Ads\Models\Ads;
use App\Core\Base\Facades\Html;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\DateBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\DateColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\ImageColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;

class AdsTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Ads::class)
            ->addColumns([
                IdColumn::make(),
                ImageColumn::make(),
                NameColumn::make()->route('ads.edit'),
                FormattedColumn::make('key')
                    ->title(trans('plugins/ads::ads.shortcode'))
                    ->alignStart()
                    ->getValueUsing(function (FormattedColumn $column) {
                        $value = $column->getItem()->key;

                        if (! function_exists('shortcode')) {
                            return $value;
                        }

                        return shortcode()->generateShortcode('ads', ['key' => $value]);
                    })
                    ->renderUsing(fn (FormattedColumn $column) => Html::tag('code', $column->getValue()))
                    ->copyable()
                    ->copyableState(fn (FormattedColumn $column) => $column->getValue()),
                Column::make('clicked')
                    ->title(trans('plugins/ads::ads.clicked'))
                    ->alignStart(),
                DateColumn::make('expired_at')->title(trans('plugins/ads::ads.expired_at')),
                StatusColumn::make(),
            ])
            ->addHeaderAction(CreateHeaderAction::make()->route('ads.create'))
            ->addActions([
                EditAction::make()->route('ads.edit'),
                DeleteAction::make()->route('ads.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make()->permission('ads.destroy'))
            ->addBulkChanges([
                NameBulkChange::make(),
                StatusBulkChange::make(),
                DateBulkChange::make()->name('expired_at')->title(trans('plugins/ads::ads.expired_at')),
            ])
            ->queryUsing(function ($query): void {
                $query->select([
                    'id',
                    'image',
                    'key',
                    'name',
                    'clicked',
                    'expired_at',
                    'status',
                ]);
            });
    }
}
