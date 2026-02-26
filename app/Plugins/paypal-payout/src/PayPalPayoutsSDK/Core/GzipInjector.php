<?php

namespace App\Plugins\PayPalPayout\PayPalPayoutsSDK\Core;

use PayPalHttp\Injector;

class GzipInjector implements Injector
{
    public function inject($httpRequest)
    {
        $httpRequest->headers['Accept-Encoding'] = 'gzip';
    }
}
