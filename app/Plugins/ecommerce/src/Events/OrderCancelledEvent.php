<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Order;
use Illuminate\Queue\SerializesModels;

class OrderCancelledEvent extends Event
{
    use SerializesModels;

    public function __construct(
        public Order $order,
        public ?string $reason = null,
        public ?string $reasonDescription = null
    ) {
    }
}
