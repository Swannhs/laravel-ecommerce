<?php

namespace App\Plugins\PayPal\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Plugins\Payment\Supports\PaymentHelper;
use App\Plugins\PayPal\Http\Requests\PayPalPaymentCallbackRequest;
use App\Plugins\PayPal\Services\Gateways\PayPalPaymentService;

class PayPalController extends BaseController
{
    public function getCallback(
        PayPalPaymentCallbackRequest $request,
        PayPalPaymentService $payPalPaymentService,
        BaseHttpResponse $response
    ) {
        $status = $payPalPaymentService->getPaymentStatus($request);

        if (! $status) {
            return $response
                ->setError()
                ->setNextUrl(PaymentHelper::getCancelURL())
                ->withInput()
                ->setMessage(trans('plugins/paypal::paypal.payment_failed'));
        }

        $payPalPaymentService->afterMakePayment($request->input());

        return $response
            ->setNextUrl(PaymentHelper::getRedirectURL())
            ->setMessage(trans('plugins/payment::payment.checkout_success'));
    }
}
