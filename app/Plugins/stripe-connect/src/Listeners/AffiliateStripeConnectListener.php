<?php

namespace App\Plugins\StripeConnect\Listeners;

use App\Plugins\AffiliatePro\Enums\PayoutPaymentMethodsEnum;
use App\Plugins\AffiliatePro\Enums\WithdrawalStatusEnum;
use App\Plugins\AffiliatePro\Events\WithdrawalApprovedEvent;
use App\Plugins\AffiliatePro\Events\WithdrawalRejectedEvent;
use App\Plugins\AffiliatePro\Events\WithdrawalRequestedEvent;
use App\Core\Base\Facades\BaseHelper;
use App\Plugins\StripeConnect\StripeConnect;
use Exception;

class AffiliateStripeConnectListener
{
    public function handle(WithdrawalRequestedEvent $event): void
    {
        $customer = $event->customer;
        $withdrawal = $event->withdrawal;

        if (
            ! is_plugin_active('affiliate-pro') ||
            ! $customer->stripe_account_id ||
            ! $customer->stripe_account_active ||
            $withdrawal->payment_channel !== PayoutPaymentMethodsEnum::STRIPE
        ) {
            return;
        }

        try {
            $stripeConnect = new StripeConnect();

            $transfer = $stripeConnect->transfer(
                $customer->stripe_account_id,
                $withdrawal->amount * 100,
                mb_strtolower($withdrawal->currency)
            );

            $withdrawal->status = WithdrawalStatusEnum::APPROVED;
            $withdrawal->transaction_id = $transfer->id;
            $withdrawal->save();

            // Update affiliate total_withdrawn (balance was already deducted when withdrawal was created)
            $affiliate = $withdrawal->affiliate;
            if ($affiliate) {
                $affiliate->total_withdrawn += $withdrawal->amount;
                $affiliate->save();

                // Create transaction record
                $affiliate->transactions()->create([
                    'amount' => -$withdrawal->amount,
                    'description' => 'Withdrawal approved via Stripe: ' . $withdrawal->transaction_id,
                    'type' => 'withdrawal',
                    'reference_id' => $withdrawal->id,
                    'reference_type' => get_class($withdrawal),
                ]);
            }

            // Fire withdrawal approved event
            event(new WithdrawalApprovedEvent($withdrawal));
        } catch (Exception $e) {
            BaseHelper::logError($e);

            $withdrawal->update([
                'status' => WithdrawalStatusEnum::REJECTED,
            ]);

            // Return the amount to the affiliate's balance
            $affiliate = $withdrawal->affiliate;
            if ($affiliate) {
                $affiliate->balance += $withdrawal->amount;
                $affiliate->save();

                // Create transaction record for the refund
                $affiliate->transactions()->create([
                    'amount' => $withdrawal->amount,
                    'description' => 'Withdrawal rejected via Stripe - amount refunded: ' . $e->getMessage(),
                    'type' => 'refund',
                    'reference_id' => $withdrawal->id,
                    'reference_type' => get_class($withdrawal),
                ]);
            }

            // Fire withdrawal rejected event
            event(new WithdrawalRejectedEvent($withdrawal, $e->getMessage()));
        }
    }
}
