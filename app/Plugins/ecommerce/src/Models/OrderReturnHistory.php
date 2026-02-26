<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\ACL\Models\User;
use App\Core\Base\Models\BaseModel;
use App\Plugins\Ecommerce\Enums\OrderReturnHistoryActionEnum;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class OrderReturnHistory extends BaseModel
{
    protected $table = 'ec_order_return_histories';

    protected $fillable = [
        'user_id',
        'order_return_id',
        'action',
        'description',
        'reason',
    ];

    protected $casts = [
        'action' => OrderReturnHistoryActionEnum::class,
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function orderReturn(): BelongsTo
    {
        return $this->belongsTo(OrderReturn::class, 'order_return_id');
    }
}
