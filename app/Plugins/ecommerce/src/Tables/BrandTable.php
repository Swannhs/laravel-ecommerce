<?php

namespace App\Plugins\Ecommerce\Tables;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Plugins\Ecommerce\Models\Brand;
use App\Core\Table\Abstracts\TableAbstract;
use App\Core\Table\Actions\DeleteAction;
use App\Core\Table\Actions\EditAction;
use App\Core\Table\BulkActions\DeleteBulkAction;
use App\Core\Table\Columns\CreatedAtColumn;
use App\Core\Table\Columns\IdColumn;
use App\Core\Table\Columns\ImageColumn;
use App\Core\Table\Columns\NameColumn;
use App\Core\Table\Columns\StatusColumn;
use App\Core\Table\Columns\YesNoColumn;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Symfony\Component\HttpFoundation\Response;

class BrandTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Brand::class)
            ->addActions([
                EditAction::make()->route('brands.edit'),
                DeleteAction::make()->route('brands.destroy'),
            ]);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this->getModel()
            ->query()
            ->select([
                'id',
                'name',
                'created_at',
                'status',
                'is_featured',
                'logo',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            ImageColumn::make('logo')
                ->title(trans('plugins/ecommerce::brands.logo')),
            NameColumn::make()->route('brands.edit'),
            YesNoColumn::make('is_featured')
                ->title(trans('core/base::tables.is_featured'))
                ->alignStart(),
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ];
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('brands.create'), 'brands.create');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('brands.destroy'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'status' => [
                'title' => trans('core/base::tables.status'),
                'type' => 'select',
                'choices' => BaseStatusEnum::labels(),
                'validate' => 'required|in:' . implode(',', BaseStatusEnum::values()),
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }

    public function renderTable($data = [], $mergeData = []): View|Factory|Response
    {
        if ($this->isEmpty()) {
            return view('plugins/ecommerce::brands.intro');
        }

        return parent::renderTable($data, $mergeData);
    }
}
