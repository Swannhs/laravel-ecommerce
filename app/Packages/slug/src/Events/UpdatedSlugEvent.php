<?php

namespace App\Packages\Slug\Events;

use App\Core\Base\Events\Event;
use App\Packages\Slug\Models\Slug;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class UpdatedSlugEvent extends Event
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(public bool|Model|null $data, public Slug $slug)
    {
    }
}
