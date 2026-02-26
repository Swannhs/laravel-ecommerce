<?php

namespace App\Plugins\Ads\Events;

use App\Core\Base\Events\Event;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class AdsLoading extends Event
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(public Collection $ads)
    {
    }
}
