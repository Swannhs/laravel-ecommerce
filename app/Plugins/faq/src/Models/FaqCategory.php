<?php

namespace App\Plugins\Faq\Models;

use App\Core\Base\Casts\SafeContent;
use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\HasMany;

class FaqCategory extends BaseModel
{
    protected $table = 'faq_categories';

    protected $fillable = [
        'name',
        'description',
        'order',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
    ];

    public function faqs(): HasMany
    {
        return $this->hasMany(Faq::class, 'category_id');
    }
}
