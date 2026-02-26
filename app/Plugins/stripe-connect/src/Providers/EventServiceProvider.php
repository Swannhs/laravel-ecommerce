<?php

namespace App\Plugins\StripeConnect\Providers;

use App\Plugins\AffiliatePro\Events\WithdrawalRequestedEvent as AffiliateWithdrawalRequestedEvent;
use App\Plugins\Marketplace\Events\WithdrawalRequested;
use App\Plugins\StripeConnect\Listeners\AffiliateStripeConnectListener;
use App\Plugins\StripeConnect\Listeners\TransferToStripeAccount;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    protected $listen = [
        WithdrawalRequested::class => [
            TransferToStripeAccount::class,
        ],
        AffiliateWithdrawalRequestedEvent::class => [
            AffiliateStripeConnectListener::class,
        ],
    ];
}
