<?php

namespace App\Core\Base\Events;

use App\Core\Base\Supports\AdminNotificationItem;
use Illuminate\Queue\SerializesModels;

class AdminNotificationEvent extends Event
{
    use SerializesModels;

    public function __construct(public AdminNotificationItem $item)
    {
    }
}
