<?php

namespace App\Plugins\Payment\Events;

use App\Core\Base\Events\Event;
use Illuminate\Foundation\Events\Dispatchable;

class PaymentWebhookReceived extends Event
{
    use Dispatchable;

    public function __construct(public string $chargeId, public array $data = [])
    {
    }
}
