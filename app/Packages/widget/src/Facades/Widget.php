<?php

namespace App\Packages\Widget\Facades;

use App\Packages\Widget\AbstractWidget;
use App\Packages\Widget\WidgetGroup;
use Illuminate\Support\Facades\Facade;

/**
 * @method static \App\Packages\Widget\Factories\WidgetFactory registerWidget(string $widget)
 * @method static array getWidgets()
 * @method static \Illuminate\Support\HtmlString|string|null run()
 * @method static void ignoreCaches(array $widgets)
 *
 * @see \App\Packages\Widget\Factories\WidgetFactory
 */
class Widget extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'platformcore.widget';
    }

    public static function group(string $name): WidgetGroup
    {
        return app('platformcore.widget-group-collection')->group($name);
    }

    public static function ignoreCaches(array $widgets): void
    {
        AbstractWidget::ignoreCaches($widgets);
    }
}
