<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Models\BaseModel;
use App\Plugins\Ecommerce\Enums\DeletionRequestStatusEnum;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class CustomerDeletionRequest extends BaseModel
{
    protected $table = 'ec_customer_deletion_requests';

    protected $fillable = [
        'customer_id',
        'customer_name',
        'customer_phone',
        'customer_email',
        'token',
        'verification_code',
        'code_expires_at',
        'status',
        'reason',
        'confirmed_at',
        'deleted_at',
    ];

    protected $casts = [
        'status' => DeletionRequestStatusEnum::class,
        'code_expires_at' => 'datetime',
        'confirmed_at' => 'datetime',
        'deleted_at' => 'datetime',
    ];

    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class, 'customer_id');
    }
}
