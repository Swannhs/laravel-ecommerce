<?php

namespace App\Plugins\Contact\Models;

use App\Core\Base\Casts\SafeContent;
use App\Core\Base\Models\BaseModel;

class ContactReply extends BaseModel
{
    protected $table = 'contact_replies';

    protected $fillable = [
        'message',
        'contact_id',
    ];

    protected $casts = [
        'message' => SafeContent::class,
    ];
}
