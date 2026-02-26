<?php

namespace App\Plugins\Payment\Models;

use App\Core\Base\Models\BaseModel;
use App\Plugins\Payment\Enums\PaymentMethodEnum;

class PaymentLog extends BaseModel
{
    protected $table = 'payment_logs';

    protected $fillable = [
        'payment_method',
        'request',
        'response',
        'ip_address',
    ];

    protected $casts = [
        'payment_method' => PaymentMethodEnum::class,
        'request' => 'array',
        'response' => 'array',
    ];
}
