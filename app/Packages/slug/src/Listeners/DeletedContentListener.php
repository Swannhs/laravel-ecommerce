<?php

namespace App\Packages\Slug\Listeners;

use App\Core\Base\Contracts\BaseModel;
use App\Core\Base\Events\DeletedContentEvent;
use App\Packages\Slug\Facades\SlugHelper;
use App\Packages\Slug\Models\Slug;

class DeletedContentListener
{
    public function handle(DeletedContentEvent $event): void
    {
        if ($event->data instanceof BaseModel && SlugHelper::isSupportedModel($event->data::class)) {
            Slug::query()->where([
                'reference_id' => $event->data->getKey(),
                'reference_type' => $event->data::class,
            ])->delete();
        }
    }
}
