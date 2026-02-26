<?php

namespace App\Plugins\Marketplace\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Customer;
use Illuminate\Queue\SerializesModels;

class NewVendorRegistered extends Event
{
    use SerializesModels;

    public function __construct(public Customer $customer)
    {
    }
}
