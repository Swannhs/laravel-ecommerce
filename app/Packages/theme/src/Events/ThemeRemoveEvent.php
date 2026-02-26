<?php

namespace App\Packages\Theme\Events;

use App\Core\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class ThemeRemoveEvent extends Event
{
    use SerializesModels;

    public function __construct(public string $theme)
    {
    }
}
