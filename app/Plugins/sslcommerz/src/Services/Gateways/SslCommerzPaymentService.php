<?php

namespace App\Plugins\SslCommerz\Services\Gateways;

use App\Plugins\SslCommerz\Services\Abstracts\SslCommerzPaymentAbstract;
use Illuminate\Http\Request;

class SslCommerzPaymentService extends SslCommerzPaymentAbstract
{
    public function makePayment(Request $request)
    {
    }

    public function afterMakePayment(Request $request)
    {
    }
}
