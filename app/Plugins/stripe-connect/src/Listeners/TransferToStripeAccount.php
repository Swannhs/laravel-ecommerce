<?php

namespace App\Plugins\StripeConnect\Listeners;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Marketplace\Enums\WithdrawalStatusEnum;
use App\Plugins\Marketplace\Events\WithdrawalRequested;
use App\Plugins\StripeConnect\StripeConnect;
use Exception;

class TransferToStripeAccount
{
    public function handle(WithdrawalRequested $event): void
    {
        $customer = $event->customer;

        if (
            ! $customer->stripe_account_id
            || ! $customer->stripe_account_active
            || $customer->vendorInfo->payout_payment_method !== 'stripe'
        ) {
            return;
        }

        $withdrawal = $event->withdrawal;

        try {
            $stripeConnect = new StripeConnect();

            $transfer = $stripeConnect->transfer(
                $customer->stripe_account_id,
                $withdrawal->amount * 100,
                mb_strtolower($withdrawal->currency)
            );
        } catch (Exception $e) {
            BaseHelper::logError($e);

            $withdrawal->update([
                'status' => WithdrawalStatusEnum::CANCELED,
            ]);

            $withdrawal->customer->vendorInfo->balance += $withdrawal->amount + $withdrawal->fee;
            $withdrawal->customer->vendorInfo->save();

            return;
        }

        if ($transfer->id) {
            $withdrawal->update([
                'status' => WithdrawalStatusEnum::COMPLETED,
            ]);
        }
    }
}
