<?php

namespace App\Plugins\LanguageAdvanced\Listeners;

use App\Core\Base\Events\UpdatedContentEvent;
use App\Core\Base\Models\BaseModel;
use App\Core\Support\Services\Cache\Cache;

class ClearCacheAfterUpdateData
{
    public function handle(UpdatedContentEvent $event): void
    {
        if (! $event->data instanceof BaseModel) {
            return;
        }

        Cache::make($event->data::class)->flush();
    }
}
