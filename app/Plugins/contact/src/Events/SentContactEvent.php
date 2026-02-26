<?php

namespace App\Plugins\Contact\Events;

use App\Core\Base\Events\Event;
use App\Core\Base\Models\BaseModel;
use Illuminate\Queue\SerializesModels;

class SentContactEvent extends Event
{
    use SerializesModels;

    public function __construct(public bool|BaseModel|null $data)
    {
    }
}
