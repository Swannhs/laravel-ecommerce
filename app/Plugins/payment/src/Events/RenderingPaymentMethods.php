<?php

namespace App\Plugins\Payment\Events;

use App\Core\Base\Events\Event;

class RenderingPaymentMethods extends Event
{
    public function __construct(public array $methods)
    {
    }
}
