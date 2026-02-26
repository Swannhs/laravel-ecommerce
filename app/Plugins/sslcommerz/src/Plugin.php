<?php

namespace App\Plugins\SslCommerz;

use App\Packages\PluginManagement\Abstracts\PluginOperationAbstract;
use App\Core\Setting\Facades\Setting;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Setting::delete([
            'payment_sslcommerz_name',
            'payment_sslcommerz_description',
            'payment_sslcommerz_store_id',
            'payment_sslcommerz_store_password',
            'payment_sslcommerz_mode',
            'payment_sslcommerz_status',
        ]);
    }
}
