<?php

namespace App\Core\Table\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Core\Table\ApiResourceDataTable;
use App\Core\Table\CollectionDataTable;
use App\Core\Table\EloquentDataTable;
use App\Core\Table\QueryDataTable;

class TableServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('core/table')
            ->loadHelpers()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->loadRoutes()
            ->publishAssets();

        $this->app['config']->set([
            'datatables.engines' => [
                'eloquent' => EloquentDataTable::class,
                'query' => QueryDataTable::class,
                'collection' => CollectionDataTable::class,
                'resource' => ApiResourceDataTable::class,
            ],
        ]);
    }
}
