<?php

namespace App\Packages\Slug\Events;

use App\Core\Base\Events\Event;
use Illuminate\Http\Request;
use Illuminate\Queue\SerializesModels;

class UpdatedPermalinkSettings extends Event
{
    use SerializesModels;

    public function __construct(public string $reference, public string $prefix, public Request $request)
    {
    }
}
