<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Customer;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class AccountDeletedEvent extends Event
{
    use Dispatchable;
    use SerializesModels;

    public function __construct(
        public string $email,
        public string $name,
        public Customer $customer
    ) {
    }
}
