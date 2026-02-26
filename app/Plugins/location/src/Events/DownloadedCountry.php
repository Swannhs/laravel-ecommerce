<?php

namespace App\Plugins\Location\Events;

use App\Core\Base\Events\Event;
use Illuminate\Queue\SerializesModels;

class DownloadedCountry extends Event
{
    use SerializesModels;
}
