<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\ACL\Models\User;
use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Order;
use Illuminate\Queue\SerializesModels;

class OrderPaymentConfirmedEvent extends Event
{
    use SerializesModels;

    public function __construct(public Order $order, public ?User $confirmedBy = null)
    {
    }
}
