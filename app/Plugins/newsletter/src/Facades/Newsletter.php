<?php

namespace App\Plugins\Newsletter\Facades;

use App\Plugins\Newsletter\Contracts\Factory;
use Illuminate\Support\Facades\Facade;

/**
 * @method static string getDefaultDriver()
 * @method static void registerNewsletterPopup(bool $keepHtmlDomOnClose = false)
 * @method static mixed driver(string|null $driver = null)
 * @method static \App\Plugins\Newsletter\NewsletterManager extend(string $driver, \Closure $callback)
 * @method static array getDrivers()
 * @method static \Illuminate\Contracts\Container\Container getContainer()
 * @method static \App\Plugins\Newsletter\NewsletterManager setContainer(\Illuminate\Contracts\Container\Container $container)
 * @method static \App\Plugins\Newsletter\NewsletterManager forgetDrivers()
 *
 * @see \App\Plugins\Newsletter\NewsletterManager
 */
class Newsletter extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return Factory::class;
    }
}
