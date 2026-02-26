<?php

namespace App\Packages\Theme\Listeners;

use App\Core\Base\Events\CacheCleared;
use App\Packages\Theme\Facades\Manager as ThemeManager;

class ClearThemeCache
{
    public function handle(CacheCleared $event): void
    {
        if (in_array($event->cacheType, ['framework', 'all'])) {
            ThemeManager::clearCache();
        }
    }
}
