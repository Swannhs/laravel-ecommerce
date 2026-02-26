<?php

namespace App\Plugins\Faq\Listeners;

use App\Core\Base\Events\DeletedContentEvent;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\MetaBox;
use Exception;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        try {
            MetaBox::deleteMetaData($event->data, 'faq_schema_config');
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
