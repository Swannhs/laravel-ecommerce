<?php

namespace App\Core\Base\Listeners;

use App\Core\Base\Events\CreatedContentEvent;
use App\Core\Base\Facades\BaseHelper;
use Exception;

class CreatedContentListener
{
    public function handle(CreatedContentEvent $event): void
    {
        try {
            do_action(BASE_ACTION_AFTER_CREATE_CONTENT, $event->screen, $event->request, $event->data);
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
