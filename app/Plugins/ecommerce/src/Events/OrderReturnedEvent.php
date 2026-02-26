<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\OrderReturn;
use Illuminate\Queue\SerializesModels;

class OrderReturnedEvent extends Event
{
    use SerializesModels;

    public function __construct(public OrderReturn $order)
    {
    }
}
