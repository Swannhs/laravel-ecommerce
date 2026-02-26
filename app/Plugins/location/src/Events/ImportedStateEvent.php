<?php

namespace App\Plugins\Location\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Location\Models\State;
use Illuminate\Queue\SerializesModels;

class ImportedStateEvent extends Event
{
    use SerializesModels;

    public function __construct(public array $row, public State $state)
    {
    }
}
