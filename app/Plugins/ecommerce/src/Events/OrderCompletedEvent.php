<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Order;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class OrderCompletedEvent extends Event
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(public Order $order)
    {
    }
}
