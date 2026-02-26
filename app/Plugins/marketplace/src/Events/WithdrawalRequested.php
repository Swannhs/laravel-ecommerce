<?php

namespace App\Plugins\Marketplace\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Marketplace\Models\Withdrawal;
use Illuminate\Queue\SerializesModels;

class WithdrawalRequested extends Event
{
    use SerializesModels;

    public function __construct(public Customer $customer, public Withdrawal $withdrawal)
    {
    }
}
