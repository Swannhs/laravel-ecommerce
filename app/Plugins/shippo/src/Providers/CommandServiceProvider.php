<?php

namespace App\Plugins\Shippo\Providers;

use App\Plugins\Shippo\Commands\InitShippoCommand;
use Illuminate\Support\ServiceProvider;

class CommandServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        $this->commands([
            InitShippoCommand::class,
        ]);
    }
}
