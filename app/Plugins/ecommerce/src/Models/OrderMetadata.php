<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class OrderMetadata extends BaseModel
{
    protected $table = 'ec_order_metadata';

    protected $fillable = [
        'order_id',
        'meta_key',
        'meta_value',
    ];

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class, 'order_id');
    }
}
