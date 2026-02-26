<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\AbandonedCart;
use Illuminate\Queue\SerializesModels;

class AbandonedCartReminderEvent extends Event
{
    use SerializesModels;

    public function __construct(
        public AbandonedCart $abandonedCart,
        public int $sequence = 1
    ) {
    }
}
