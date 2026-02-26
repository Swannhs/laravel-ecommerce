<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\Base\Models\BaseModel;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\MassPrunable;

class SharedWishlist extends BaseModel
{
    use MassPrunable;

    protected $table = 'ec_shared_wishlists';

    protected $fillable = [
        'code',
        'product_ids',
    ];

    protected $casts = [
        'product_ids' => 'array',
    ];

    public function prunable(): Builder
    {
        return $this->where('created_at', '<=', Carbon::now()->subDays(EcommerceHelper::getSharedWishlistLifetime()));
    }
}
