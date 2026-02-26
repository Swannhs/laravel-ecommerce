<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Shipment;
use Illuminate\Queue\SerializesModels;

class ShippingStatusChanged extends Event
{
    use SerializesModels;

    public function __construct(public Shipment $shipment, public array $previousShipment = [])
    {
    }
}
