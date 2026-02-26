<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Models\BaseModel;
use App\Core\Base\Models\Concerns\HasPhoneNumber;
use App\Plugins\Ecommerce\Traits\LocationTrait;

class Address extends BaseModel
{
    use HasPhoneNumber;
    use LocationTrait;

    protected $table = 'ec_customer_addresses';

    protected $fillable = [
        'name',
        'phone',
        'email',
        'country',
        'state',
        'city',
        'address',
        'zip_code',
        'customer_id',
        'is_default',
    ];
}
