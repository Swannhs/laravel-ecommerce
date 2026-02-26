<?php

namespace App\Plugins\Ecommerce\Models;

use App\Core\ACL\Models\User;
use App\Core\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class ReviewReply extends BaseModel
{
    protected $table = 'ec_review_replies';

    protected $fillable = [
        'review_id',
        'user_id',
        'message',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class);
    }

    public function review(): BelongsTo
    {
        return $this->belongsTo(Review::class);
    }
}
