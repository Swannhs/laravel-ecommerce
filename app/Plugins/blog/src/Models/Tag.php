<?php

namespace App\Plugins\Blog\Models;

use App\Core\Base\Casts\SafeContent;
use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Models\BaseModel;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Tag extends BaseModel
{
    protected $table = 'tags';

    protected $fillable = [
        'name',
        'description',
        'status',
        'author_id',
        'author_type',
    ];

    protected $casts = [
        'status' => BaseStatusEnum::class,
        'name' => SafeContent::class,
        'description' => SafeContent::class,
    ];

    protected static function booted(): void
    {
        static::deleted(function (Tag $tag): void {
            $tag->posts()->detach();
        });
    }

    public function posts(): BelongsToMany
    {
        return $this->belongsToMany(Post::class, 'post_tags');
    }
}
