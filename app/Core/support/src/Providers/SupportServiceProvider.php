<?php

namespace App\Core\Support\Providers;

use App\Core\Base\Supports\ServiceProvider;

class SupportServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->app['files']->requireOnce(core_path('support/helpers/common.php'));
    }
}
