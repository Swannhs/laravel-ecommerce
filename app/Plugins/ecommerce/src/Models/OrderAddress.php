<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Models\BaseModel;
use App\Core\Base\Supports\Avatar;
use App\Plugins\Ecommerce\Enums\OrderAddressTypeEnum;
use App\Plugins\Ecommerce\Traits\LocationTrait;
use App\Core\Media\Facades\RvMedia;
use Exception;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class OrderAddress extends BaseModel
{
    use LocationTrait;

    protected $table = 'ec_order_addresses';

    protected $fillable = [
        'name',
        'email',
        'phone',
        'country',
        'state',
        'city',
        'address',
        'zip_code',
        'order_id',
        'type',
    ];

    public $timestamps = false;

    protected $casts = [
        'type' => OrderAddressTypeEnum::class,
    ];

    protected function avatarUrl(): Attribute
    {
        return Attribute::get(function () {
            try {
                return (new Avatar())->create($this->name)->toBase64();
            } catch (Exception) {
                return RvMedia::getDefaultImage();
            }
        });
    }

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class)->withDefault();
    }
}
