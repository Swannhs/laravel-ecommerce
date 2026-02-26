<?php

namespace App\Core\Chart\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;

class ChartServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('core/chart')
            ->loadAndPublishViews();
    }
}
