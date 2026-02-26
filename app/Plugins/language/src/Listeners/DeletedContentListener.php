<?php

namespace App\Plugins\Language\Listeners;

use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Language\Facades\Language;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            Language::deleteLanguage($event->screen, $event->data);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
