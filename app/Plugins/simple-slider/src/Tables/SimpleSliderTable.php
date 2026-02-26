<?php

namespace App\Plugins\SimpleSlider\Tables;

use App\Core\Base\Facades\Html;
use App\Plugins\SimpleSlider\Models\SimpleSlider;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\BulkChanges\CreatedAtBulkChange;
use App\Core\Table\BulkChanges\NameBulkChange;
use App\Core\Table\BulkChanges\StatusBulkChange;
use App\Core\Table\BulkChanges\TextBulkChange;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\HeaderActions\CreateHeaderAction;
use Illuminate\Database\Eloquent\Builder;

class SimpleSliderTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SimpleSlider::class)
            ->addHeaderAction(CreateHeaderAction::make()->route('simple-slider.create'))
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()->route('simple-slider.edit'),
                FormattedColumn::make('key')
                    ->title(trans('plugins/simple-slider::simple-slider.shortcode'))
                    ->alignStart()
                    ->getValueUsing(function (FormattedColumn $column) {
                        $value = $column->getItem()->key;

                        if (! function_exists('shortcode')) {
                            return $value;
                        }

                        return shortcode()->generateShortcode('simple-slider', ['alias' => $value]);
                    })
                    ->renderUsing(fn (FormattedColumn $column) => Html::tag('code', $column->getValue()))
                    ->copyable(),
                CreatedAtColumn::make(),
                StatusColumn::make(),
            ])
            ->addActions([
                EditAction::make()->route('simple-slider.edit'),
                DeleteAction::make()->route('simple-slider.destroy'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('simple-slider.destroy'),
            ])
            ->addBulkChanges([
                NameBulkChange::make(),
                TextBulkChange::make()
                    ->name('key')
                    ->title(trans('plugins/simple-slider::simple-slider.key')),
                StatusBulkChange::make(),
                CreatedAtBulkChange::make(),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'name',
                        'key',
                        'status',
                        'created_at',
                    ]);
            });
    }
}
