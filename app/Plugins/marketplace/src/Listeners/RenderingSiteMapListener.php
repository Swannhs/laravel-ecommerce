<?php

namespace App\Plugins\Marketplace\Listeners;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Plugins\Marketplace\Models\Store;
use App\Packages\Theme\Events\RenderingSiteMapEvent;
use App\Packages\Theme\Facades\SiteMapManager;

class RenderingSiteMapListener
{
    public function handle(RenderingSiteMapEvent $event): void
    {
        if ($key = $event->key) {
            switch ($key) {
                case 'stores':
                    $stores = Store::query()
                        ->with('slugable')
                        ->where('status', BaseStatusEnum::PUBLISHED)->latest()
                        ->select(['id', 'name', 'updated_at'])
                        ->get();

                    foreach ($stores as $store) {
                        if (! $store->slugable) {
                            continue;
                        }

                        SiteMapManager::add($store->url, $store->updated_at, '0.8');
                    }

                    break;
                case 'pages':
                    SiteMapManager::add(route('public.stores'), null, '1', 'monthly');

                    break;
            }
        } else {
            SiteMapManager::addSitemap(SiteMapManager::route('stores'));
        }
    }
}
