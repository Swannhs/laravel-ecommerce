<?php

namespace App\Plugins\Mollie\Services\Gateways;

use App\Plugins\Mollie\Services\Abstracts\MolliePaymentAbstract;
use Illuminate\Http\Request;

class MolliePaymentService extends MolliePaymentAbstract
{
    public function makePayment(Request $request)
    {
    }

    public function afterMakePayment(Request $request)
    {
    }
}
