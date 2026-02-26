<?php

namespace App\Packages\SeoHelper\Listeners;

use App\Core\Base\Events\UpdatedContentEvent;
use App\Core\Base\Facades\BaseHelper;
use App\Packages\SeoHelper\Facades\SeoHelper;
use Exception;

class UpdatedContentListener
{
    public function handle(UpdatedContentEvent $event): void
    {
        try {
            SeoHelper::saveMetaData($event->screen, $event->request, $event->data);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
