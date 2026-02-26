<?php

namespace App\Packages\Menu\Listeners;

use App\Core\Base\Contracts\BaseModel;
use App\Core\Base\Events\DeletedContentEvent;
use App\Packages\Menu\Facades\Menu;
use App\Packages\Menu\Models\MenuNode;

class DeleteMenuNodeListener
{
    public function handle(DeletedContentEvent $event): void
    {
        if (
            ! $event->data instanceof BaseModel ||
            ! in_array($event->data::class, Menu::getMenuOptionModels())
        ) {
            return;
        }

        MenuNode::query()
            ->where([
                'reference_id' => $event->data->getKey(),
                'reference_type' => $event->data::class,
            ])
            ->delete();
    }
}
