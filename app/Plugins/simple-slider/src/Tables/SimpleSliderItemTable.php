<?php

namespace App\Plugins\SimpleSlider\Tables;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Plugins\SimpleSlider\Models\SimpleSliderItem;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\Columns\Column;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\FormattedColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\ImageColumn;
use Illuminate\Database\Eloquent\Builder;

class SimpleSliderItemTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SimpleSliderItem::class)
            ->setView('plugins/simple-slider::items')
            ->setDom($this->simpleDom())
            ->addColumns([
                IdColumn::make(),
                ImageColumn::make(),
                FormattedColumn::make('title')
                    ->title(trans('core/base::tables.title'))
                    ->alignStart()
                    ->getValueUsing(function (FormattedColumn $column) {
                        $item = $column->getItem();

                        $name = BaseHelper::clean($item->title);

                        if (! $this->hasPermission('simple-slider-item.edit')) {
                            return $name;
                        }

                        return $name ? Html::link(route('simple-slider-item.edit', $item->getKey()), $name, [
                            'data-bs-toggle' => 'modal',
                            'data-bs-target' => '#simple-slider-item-modal',
                        ]) : '&mdash;';
                    }),
                Column::make('order')
                    ->title(trans('core/base::tables.order'))
                    ->className('text-start order-column'),
                CreatedAtColumn::make(),
            ])
            ->addActions([
                EditAction::make()
                    ->route('simple-slider-item.edit')
                    ->attributes([
                        'data-bs-toggle' => 'modal',
                        'data-bs-target' => '#simple-slider-item-modal',
                    ])
                    ->permission('simple-slider-item.edit'),
                DeleteAction::make()
                    ->route('simple-slider-item.destroy')
                    ->permission('simple-slider-item.destroy'),
            ])
            ->queryUsing(function (Builder $query) {
                return $query
                    ->select([
                        'id',
                        'title',
                        'image',
                        'order',
                        'created_at',
                    ])
                    ->oldest('order')
                    ->where('simple_slider_id', request()->route()->parameter('id'));
            });
    }
}
