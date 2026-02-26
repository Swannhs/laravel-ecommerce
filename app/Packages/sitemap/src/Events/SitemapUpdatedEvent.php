<?php

namespace App\Packages\Sitemap\Events;

use App\Core\Base\Events\Event;

class SitemapUpdatedEvent extends Event
{
    public function __construct(public ?string $sitemapUrl = null)
    {
    }
}
