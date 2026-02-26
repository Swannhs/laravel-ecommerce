<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\OrderProduct;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class OrderProductCreatedEvent extends Event
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(public OrderProduct $orderProduct)
    {
    }
}
