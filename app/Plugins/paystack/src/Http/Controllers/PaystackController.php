<?php

namespace App\Plugins\Paystack\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Plugins\Payment\Enums\PaymentStatusEnum;
use App\Plugins\Payment\Supports\PaymentHelper;
use App\Plugins\Paystack\Services\Paystack;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;

class PaystackController extends BaseController
{
    public function getPaymentStatus(Request $request, BaseHttpResponse $response, Paystack $paystack)
    {
        do_action('payment_before_making_api_request', PAYSTACK_PAYMENT_METHOD_NAME, []);

        $result = $paystack->getPaymentData();

        do_action('payment_after_api_response', PAYSTACK_PAYMENT_METHOD_NAME, [], $result);

        if (! $result['status']) {
            return $response
                ->setError()
                ->setNextUrl(PaymentHelper::getCancelURL())
                ->setMessage($result['message']);
        }

        do_action(PAYMENT_ACTION_PAYMENT_PROCESSED, [
            'amount' => $result['data']['amount'] / 100,
            'currency' => $result['data']['currency'],
            'charge_id' => $result['data']['reference'],
            'payment_channel' => PAYSTACK_PAYMENT_METHOD_NAME,
            'status' => PaymentStatusEnum::COMPLETED,
            'customer_id' => Arr::get($result['data']['metadata'], 'customer_id'),
            'customer_type' => Arr::get($result['data']['metadata'], 'customer_type'),
            'payment_type' => 'direct',
            'order_id' => (array) $result['data']['metadata']['order_id'],
        ], $request);

        return $response
            ->setNextUrl(PaymentHelper::getRedirectURL())
            ->setMessage(trans('plugins/payment::payment.checkout_success'));
    }
}
