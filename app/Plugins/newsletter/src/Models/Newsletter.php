<?php

namespace App\Plugins\Newsletter\Models;

use App\Core\Base\Casts\SafeContent;
use App\Core\Base\Models\BaseModel;
use App\Plugins\Newsletter\Enums\NewsletterStatusEnum;

class Newsletter extends BaseModel
{
    protected $table = 'newsletters';

    protected $fillable = [
        'email',
        'name',
        'status',
    ];

    protected $casts = [
        'name' => SafeContent::class,
        'status' => NewsletterStatusEnum::class,
    ];
}
