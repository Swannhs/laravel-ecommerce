<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Casts\SafeContent;
use App\Core\Base\Models\BaseModel;
use App\Plugins\Ecommerce\Enums\ShippingRuleTypeEnum;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ShippingRule extends BaseModel
{
    protected $table = 'ec_shipping_rules';

    protected $fillable = [
        'name',
        'price',
        'type',
        'from',
        'to',
        'shipping_id',
    ];

    protected static function booted(): void
    {
        static::deleted(function (ShippingRule $shippingRule): void {
            $shippingRule->items()->delete();
        });
    }

    protected $casts = [
        'type' => ShippingRuleTypeEnum::class,
        'name' => SafeContent::class,
    ];

    public function shipping(): BelongsTo
    {
        return $this->belongsTo(Shipping::class)->withDefault();
    }

    public function items(): HasMany
    {
        return $this->hasMany(ShippingRuleItem::class);
    }
}
