<?php

namespace App\Packages\Page\Listeners;

use App\Core\Base\Supports\RepositoryHelper;
use App\Packages\Page\Models\Page;
use App\Packages\Theme\Events\RenderingSiteMapEvent;
use App\Packages\Theme\Facades\SiteMapManager;

class RenderingSiteMapListener
{
    public function handle(RenderingSiteMapEvent $event): void
    {
        if ($event->key == 'pages') {
            $pages = Page::query()
                ->wherePublished()->latest()
                ->select(['id', 'name', 'updated_at'])
                ->with('slugable');

            $pages = RepositoryHelper::applyBeforeExecuteQuery($pages, new Page())->get();

            foreach ($pages as $page) {
                SiteMapManager::add($page->url, $page->updated_at, '0.8');
            }
        }
    }
}
