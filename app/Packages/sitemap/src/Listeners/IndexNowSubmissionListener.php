<?php

namespace App\Packages\Sitemap\Listeners;

use App\Packages\Sitemap\Events\SitemapUpdatedEvent;
use App\Packages\Sitemap\Jobs\IndexNowSubmissionJob;
use App\Packages\Sitemap\Services\IndexNowService;
use Carbon\Carbon;

class IndexNowSubmissionListener
{
    public function __construct(protected IndexNowService $indexNowService)
    {
    }

    public function handle(SitemapUpdatedEvent $event): void
    {
        if (! $this->indexNowService->isEnabled()) {
            return;
        }

        if (! $this->indexNowService->getApiKey()) {
            return;
        }

        IndexNowSubmissionJob::dispatch($event->sitemapUrl)
            ->delay(Carbon::now()->addSeconds(30));
    }
}
