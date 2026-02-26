<?php

namespace App\Plugins\Language\Listeners;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Language\Facades\Language;
use Exception;

class CreatedContentListener
{
    public function handle(CreatedContentEvent $event): void
    {
        try {
            if ($event->request->input('language')) {
                Language::saveLanguage($event->screen, $event->request, $event->data);
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
