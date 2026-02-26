<?php

namespace App\Plugins\Marketplace\Models;

use App\Core\ACL\Models\User;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\Html;
use App\Core\Base\Models\BaseModel;
use App\Plugins\Ecommerce\Models\Currency;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Ecommerce\Models\Order;
use App\Plugins\Marketplace\Enums\RevenueTypeEnum;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Revenue extends BaseModel
{
    protected $table = 'mp_customer_revenues';

    protected $fillable = [
        'customer_id',
        'order_id',
        'sub_amount',
        'fee',
        'amount',
        'current_balance',
        'currency',
        'description',
        'user_id',
        'type',
    ];

    protected $casts = [
        'type' => RevenueTypeEnum::class,
    ];

    public function customer(): BelongsTo
    {
        return $this->belongsTo(Customer::class)->withDefault();
    }

    public function order(): BelongsTo
    {
        return $this->belongsTo(Order::class)->withDefault();
    }

    public function currencyRelation(): BelongsTo
    {
        return $this->belongsTo(Currency::class, 'currency', 'title')->withDefault();
    }

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class)->withDefault();
    }

    public function getDescriptionTooltipAttribute(): string
    {
        if (! $this->description) {
            return '';
        }

        return Html::tag('span', BaseHelper::renderIcon('ti ti-info-circle'), [
            'class' => 'ms-1 text-info',
            'data-bs-toggle' => 'tooltip',
            'data-bs-original-title' => $this->description,
            'title' => $this->description,
        ]);
    }
}
