<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Models\BaseModel;
use App\Plugins\Ecommerce\Traits\LocationTrait;

class StoreLocator extends BaseModel
{
    use LocationTrait;

    protected $table = 'ec_store_locators';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'address',
        'country',
        'state',
        'city',
        'zip_code',
        'is_primary',
        'is_shipping_location',
    ];
}
