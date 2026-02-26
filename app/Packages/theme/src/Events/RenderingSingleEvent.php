<?php

namespace App\Packages\Theme\Events;

use App\Core\Base\Events\Event;
use App\Packages\Slug\Models\Slug;
use Illuminate\Queue\SerializesModels;

class RenderingSingleEvent extends Event
{
    use SerializesModels;

    public function __construct(public Slug $slug)
    {
    }
}
