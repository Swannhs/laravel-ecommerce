<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class DiscountProduct extends BaseModel
{
    protected $table = 'ec_discount_products';

    protected $fillable = [
        'discount_id',
        'product_id',
    ];

    public function products(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'product_id')->withDefault();
    }
}
