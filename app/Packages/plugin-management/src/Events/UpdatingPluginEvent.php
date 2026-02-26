<?php

namespace App\Packages\PluginManagement\Events;

use App\Core\Base\Events\Event;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class UpdatingPluginEvent extends Event
{
    use SerializesModels;
    use Dispatchable;

    public function __construct(public string $plugin)
    {
    }
}
