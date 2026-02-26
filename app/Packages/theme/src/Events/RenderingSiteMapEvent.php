<?php

namespace App\Packages\Theme\Events;

use App\Core\Base\Events\Event;

class RenderingSiteMapEvent extends Event
{
    public function __construct(public ?string $key = null)
    {
    }
}
