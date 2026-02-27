<?php

namespace App\Packages\Widget\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @method static \App\Packages\Widget\WidgetGroup group(string $sidebarId)
 * @method static \App\Packages\Widget\WidgetGroupCollection setGroup(array $args)
 * @method static \App\Packages\Widget\WidgetGroupCollection removeGroup(string $groupId)
 * @method static array getGroups()
 * @method static string render(string $sidebarId)
 * @method static void load(bool $force = false)
 * @method static \Illuminate\Support\Collection getData()
 *
 * @see \App\Packages\Widget\WidgetGroupCollection
 */
class WidgetGroup extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'platformcore.widget-group-collection';
    }
}
