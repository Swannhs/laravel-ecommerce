<?php

namespace App\Packages\SeoHelper\Listeners;

use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Facades\BaseHelper;
use App\Packages\SeoHelper\Facades\SeoHelper;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            SeoHelper::deleteMetaData($event->screen, $event->data);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
