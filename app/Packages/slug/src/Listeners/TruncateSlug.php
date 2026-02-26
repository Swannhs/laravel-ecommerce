<?php

namespace App\Packages\Slug\Listeners;

use App\Packages\Slug\Models\Slug;

class TruncateSlug
{
    public function handle(): void
    {
        Slug::query()->truncate();
    }
}
