<?php

namespace App\Plugins\Testimonial\Models;

use App\Core\Base\Casts\SafeContent;
use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Models\BaseModel;

class Testimonial extends BaseModel
{
    protected $table = 'testimonials';

    protected $fillable = [
        'name',
        'company',
        'content',
        'image',
        'status',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'content' => SafeContent::class,
        'company' => SafeContent::class,
        'name' => SafeContent::class,
    ];
}
