<?php

namespace App\Core\Base\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @method static void fire(string $action, array $args)
 * @method static void addListener(array|string|null $hook, \Closure|array|string $callback, int $priority = 20, int $arguments = 1)
 * @method static \App\Core\Base\Supports\ActionHookEvent removeListener(string $hook)
 * @method static array getListeners()
 *
 * @see \App\Core\Base\Supports\Action
 */
class Action extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return 'core.action';
    }
}
