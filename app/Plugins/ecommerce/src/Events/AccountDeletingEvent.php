<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\CustomerDeletionRequest;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class AccountDeletingEvent extends Event
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(public CustomerDeletionRequest $deletionRequest)
    {
    }
}
