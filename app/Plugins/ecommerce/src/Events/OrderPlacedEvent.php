<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Order;
use Illuminate\Queue\SerializesModels;

class OrderPlacedEvent extends Event
{
    use SerializesModels;

    public function __construct(public Order $order)
    {
    }
}
