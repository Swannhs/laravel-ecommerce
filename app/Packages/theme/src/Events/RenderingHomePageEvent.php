<?php

namespace App\Packages\Theme\Events;

use App\Core\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class RenderingHomePageEvent extends Event
{
    use SerializesModels;
}
