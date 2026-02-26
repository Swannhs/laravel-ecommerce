<?php

namespace App\Packages\Menu\Listeners;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Models\BaseModel;
use App\Core\Base\Supports\RepositoryHelper;
use App\Packages\Menu\Facades\Menu;
use App\Packages\Menu\Models\MenuNode;
use App\Packages\Slug\Events\UpdatedSlugEvent;
use Exception;

class UpdateMenuNodeUrlListener
{
    public function handle(UpdatedSlugEvent $event): void
    {
        if (
            ! $event->data instanceof BaseModel ||
            ! in_array($event->data::class, Menu::getMenuOptionModels())
        ) {
            return;
        }

        try {
            $query = MenuNode::query()
                ->where([
                    'reference_id' => $event->data->getKey(),
                    'reference_type' => $event->data::class,
                ]);

            $nodes = RepositoryHelper::applyBeforeExecuteQuery($query, $event->data)->get();

            foreach ($nodes as $node) {
                $newUrl = str_replace(url(''), '', $node->reference->url);
                if ($node->url != $newUrl) {
                    $node->url = $newUrl;
                    $node->save();
                }
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
