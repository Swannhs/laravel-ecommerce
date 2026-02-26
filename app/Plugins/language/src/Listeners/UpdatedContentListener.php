<?php

namespace App\Plugins\Language\Listeners;

use App\Core\Base\Events\UpdatedContentEvent;
use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Language\Facades\Language;
use Exception;

class UpdatedContentListener
{
    public function handle(UpdatedContentEvent $event): void
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
