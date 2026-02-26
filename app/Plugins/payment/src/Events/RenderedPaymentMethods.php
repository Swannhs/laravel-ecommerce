<?php

namespace App\Plugins\Payment\Events;

use App\Core\Base\Events\Event;

class RenderedPaymentMethods extends Event
{
    public function __construct(public string $html)
    {
    }
}
