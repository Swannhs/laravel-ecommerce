<?php

namespace App\Plugins\AuditLog\Listeners;

use App\Plugins\AuditLog\AuditLog;
use App\Plugins\AuditLog\Events\AuditHandlerEvent;
use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Facades\BaseHelper;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            if ($event->data->getKey()) {
                $model = $event->screen;

                event(new AuditHandlerEvent(
                    $model,
                    'deleted',
                    $event->data->getKey(),
                    AuditLog::getReferenceName($model, $event->data),
                    'danger'
                ));
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
