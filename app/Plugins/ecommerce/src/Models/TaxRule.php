<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Models\BaseModel;
use App\Plugins\Ecommerce\Traits\LocationTrait;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class TaxRule extends BaseModel
{
    use LocationTrait;

    protected $table = 'ec_tax_rules';

    protected $fillable = [
        'tax_id',
        'country',
        'state',
        'city',
        'zip_code',
        'percentage',
        'priority',
        'is_enabled',
    ];

    public function tax(): BelongsTo
    {
        return $this->belongsTo(Tax::class)->withDefault();
    }
}
