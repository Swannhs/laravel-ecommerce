<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Application Name
    |--------------------------------------------------------------------------
    |
    | This value is the name of your application, which will be used when the
    | framework needs to place the application's name in a notification or
    | other UI elements where an application name needs to be displayed.
    |
    */

    'name' => env('APP_NAME', 'Laravel'),

    /*
    |--------------------------------------------------------------------------
    | Application Environment
    |--------------------------------------------------------------------------
    |
    | This value determines the "environment" your application is currently
    | running in. This may determine how you prefer to configure various
    | services the application utilizes. Set this in your ".env" file.
    |
    */

    'env' => env('APP_ENV', 'production'),

    /*
    |--------------------------------------------------------------------------
    | Application Debug Mode
    |--------------------------------------------------------------------------
    |
    | When your application is in debug mode, detailed error messages with
    | stack traces will be shown on every error that occurs within your
    | application. If disabled, a simple generic error page is shown.
    |
    */

    'debug' => (bool) env('APP_DEBUG', false),

    /*
    |--------------------------------------------------------------------------
    | Application URL
    |--------------------------------------------------------------------------
    |
    | This URL is used by the console to properly generate URLs when using
    | the Artisan command line tool. You should set this to the root of
    | the application so that it's available within Artisan commands.
    |
    */

    'url' => env('APP_URL', 'http://localhost'),

    /*
    |--------------------------------------------------------------------------
    | Application Timezone
    |--------------------------------------------------------------------------
    |
    | Here you may specify the default timezone for your application, which
    | will be used by the PHP date and date-time functions. The timezone
    | is set to "UTC" by default as it is suitable for most use cases.
    |
    */

    'timezone' => 'UTC',

    /*
    |--------------------------------------------------------------------------
    | Application Locale Configuration
    |--------------------------------------------------------------------------
    |
    | The application locale determines the default locale that will be used
    | by Laravel's translation / localization methods. This option can be
    | set to any locale for which you plan to have translation strings.
    |
    */

    'locale' => env('APP_LOCALE', 'en'),

    'fallback_locale' => env('APP_FALLBACK_LOCALE', 'en'),

    'faker_locale' => env('APP_FAKER_LOCALE', 'en_US'),

    /*
    |--------------------------------------------------------------------------
    | Encryption Key
    |--------------------------------------------------------------------------
    |
    | This key is utilized by Laravel's encryption services and should be set
    | to a random, 32 character string to ensure that all encrypted values
    | are secure. You should do this prior to deploying the application.
    |
    */

    'cipher' => 'AES-256-CBC',

    'key' => env('APP_KEY'),

    'previous_keys' => [
        ...array_filter(
            explode(',', (string) env('APP_PREVIOUS_KEYS', ''))
        ),
    ],

    'aliases' => [
        'Action' => Botble\Base\Facades\Action::class,
        'AdminAppearance' => Botble\Base\Facades\AdminAppearance::class,
        'AdminBar' => Botble\Theme\Facades\AdminBar::class,
        'AdminHelper' => Botble\Base\Facades\AdminHelper::class,
        'Assets' => Botble\Base\Facades\Assets::class,
        'BaseHelper' => Botble\Base\Facades\BaseHelper::class,
        'Breadcrumbs' => Botble\Base\Facades\Breadcrumbs::class,
        'CoreIcon' => Botble\Icon\Facades\Icon::class,
        'DashboardMenu' => Botble\Base\Facades\DashboardMenu::class,
        'EmailHandler' => Botble\Base\Facades\EmailHandler::class,
        'Filter' => Botble\Base\Facades\Filter::class,
        'Form' => Botble\Base\Facades\Form::class,
        'Html' => Botble\Base\Facades\Html::class,
        'JsValidator' => Botble\JsValidation\Facades\JsValidator::class,
        'MacroableModels' => Botble\Base\Facades\MacroableModels::class,
        'Menu' => Botble\Menu\Facades\Menu::class,
        'MetaBox' => Botble\Base\Facades\MetaBox::class,
        'OptimizerHelper' => Botble\Optimize\Facades\OptimizerHelper::class,
        'PageTitle' => Botble\Base\Facades\PageTitle::class,
        'PanelSectionManager' => Botble\Base\Facades\PanelSectionManager::class,
        'RvMedia' => Botble\Media\Facades\RvMedia::class,
        'SeoHelper' => Botble\SeoHelper\Facades\SeoHelper::class,
        'Setting' => Botble\Setting\Facades\Setting::class,
        'Shortcode' => Botble\Shortcode\Facades\Shortcode::class,
        'SiteMapManager' => Botble\Theme\Facades\SiteMapManager::class,
        'SlugHelper' => Botble\Slug\Facades\SlugHelper::class,
        'Theme' => Botble\Theme\Facades\Theme::class,
        'ThemeManager' => Botble\Theme\Facades\Manager::class,
        'ThemeOption' => Botble\Theme\Facades\ThemeOption::class,
        'Widget' => Botble\Widget\Facades\Widget::class,
        'WidgetGroup' => Botble\Widget\Facades\WidgetGroup::class,
    ],

    /*
    |--------------------------------------------------------------------------
    | Maintenance Mode Driver
    |--------------------------------------------------------------------------
    |
    | These configuration options determine the driver used to determine and
    | manage Laravel's "maintenance mode" status. The "cache" driver will
    | allow maintenance mode to be controlled across multiple machines.
    |
    | Supported drivers: "file", "cache"
    |
    */

    'maintenance' => [
        'driver' => env('APP_MAINTENANCE_DRIVER', 'file'),
        'store' => env('APP_MAINTENANCE_STORE', 'database'),
    ],

];
