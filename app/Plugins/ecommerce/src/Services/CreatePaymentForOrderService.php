<?php

namespace App\Plugins\Ecommerce\Services;

use App\Core\ACL\Models\User;
use App\Plugins\Ecommerce\Enums\OrderHistoryActionEnum;
use App\Plugins\Ecommerce\Events\OrderPaymentConfirmedEvent;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Ecommerce\Models\Order;
use App\Plugins\Ecommerce\Models\OrderHistory;
use App\Plugins\Payment\Enums\PaymentStatusEnum;
use App\Plugins\Payment\Models\Payment;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class CreatePaymentForOrderService
{
    public function execute(
        Order $order,
        string $paymentMethod,
        string $paymentStatus = PaymentStatusEnum::PENDING,
        string|int|null $customerId = null,
        ?string $chargeId = null,
    ): void {
        if (! is_plugin_active('payment')) {
            return;
        }

        if ($order->payment->exists) {
            $order->payment->update([
                'payment_channel' => $paymentMethod,
                'status' => $paymentStatus,
            ]);
        }

        /**
         * @var User $user
         */
        $user = Auth::user();

        // Get payment fee directly from payment settings
        $paymentFee = (float) get_payment_setting('fee', $paymentMethod, 0);

        $data = [
            'amount' => $order->amount,
            'payment_fee' => $paymentFee,
            'currency' => cms_currency()->getDefaultCurrency()->title,
            'payment_channel' => $paymentMethod,
            'status' => $paymentStatus,
            'payment_type' => 'confirm',
            'order_id' => $order->getKey(),
            'charge_id' => $chargeId ?: Str::upper(Str::random(10)),
            'user_id' => $user->getKey(),
        ];

        if ($customerId) {
            $data = [
                ...$data,
                'customer_id' => $customerId,
                'customer_type' => Customer::class,
            ];
        }

        $payment = Payment::query()->create($data);

        $order->payment_id = $payment->getKey();
        $order->save();

        if ($paymentStatus == PaymentStatusEnum::COMPLETED) {
            event(new OrderPaymentConfirmedEvent($order, $user));

            OrderHistory::query()->create([
                'action' => OrderHistoryActionEnum::CONFIRM_PAYMENT,
                'description' => trans('plugins/ecommerce::order.payment_was_confirmed_by', [
                    'money' => format_price($order->amount),
                ]),
                'order_id' => $order->getKey(),
                'user_id' => $user->getKey(),
            ]);
        }
    }
}
