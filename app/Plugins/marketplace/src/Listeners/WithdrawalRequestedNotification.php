<?php

namespace App\Plugins\Marketplace\Listeners;

use App\Core\Base\Events\AdminNotificationEvent;
use App\Core\Base\Supports\AdminNotificationItem;
use App\Plugins\Marketplace\Events\WithdrawalRequested;

class WithdrawalRequestedNotification
{
    public function handle(WithdrawalRequested $event): void
    {
        event(new AdminNotificationEvent(
            AdminNotificationItem::make()
                ->title(trans('plugins/marketplace::withdrawal.new_withdrawal_request_notifications.new_withdrawal_request'))
                ->description(trans('plugins/marketplace::withdrawal.new_withdrawal_request_notifications.description', [
                    'customer' => $event->customer->name,
                ]))
                ->action(trans('plugins/marketplace::withdrawal.new_withdrawal_request_notifications.view'), route('marketplace.withdrawal.edit', $event->withdrawal->id))
                ->permission('marketplace.withdrawal.edit')
        ));
    }
}
