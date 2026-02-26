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
        'Action' => App\Core\Base\Facades\Action::class,
        'AdminAppearance' => App\Core\Base\Facades\AdminAppearance::class,
        'AdminBar' => App\Packages\Theme\Facades\AdminBar::class,
        'AdminHelper' => App\Core\Base\Facades\AdminHelper::class,
        'Assets' => App\Core\Base\Facades\Assets::class,
        'BaseHelper' => App\Core\Base\Facades\BaseHelper::class,
        'Breadcrumbs' => App\Core\Base\Facades\Breadcrumbs::class,
        'CoreIcon' => App\Core\Icon\Facades\Icon::class,
        'DashboardMenu' => App\Core\Base\Facades\DashboardMenu::class,
        'EmailHandler' => App\Core\Base\Facades\EmailHandler::class,
        'Filter' => App\Core\Base\Facades\Filter::class,
        'Form' => App\Core\Base\Facades\Form::class,
        'FormBuilder' => Kris\LaravelFormBuilder\Facades\FormBuilder::class,
        'Html' => App\Core\Base\Facades\Html::class,
        'JsValidator' => App\Core\JsValidation\Facades\JsValidator::class,
        'MacroableModels' => App\Core\Base\Facades\MacroableModels::class,
        'Menu' => App\Packages\Menu\Facades\Menu::class,
        'MetaBox' => App\Core\Base\Facades\MetaBox::class,
        'OptimizerHelper' => App\Packages\Optimize\Facades\OptimizerHelper::class,
        'PageTitle' => App\Core\Base\Facades\PageTitle::class,
        'PanelSectionManager' => App\Core\Base\Facades\PanelSectionManager::class,
        'RvMedia' => App\Core\Media\Facades\RvMedia::class,
        'SeoHelper' => App\Packages\SeoHelper\Facades\SeoHelper::class,
        'Setting' => App\Core\Setting\Facades\Setting::class,
        'Shortcode' => App\Packages\Shortcode\Facades\Shortcode::class,
        'SiteMapManager' => App\Packages\Theme\Facades\SiteMapManager::class,
        'SlugHelper' => App\Packages\Slug\Facades\SlugHelper::class,
        'Theme' => App\Packages\Theme\Facades\Theme::class,
        'ThemeManager' => App\Packages\Theme\Facades\Manager::class,
        'ThemeOption' => App\Packages\Theme\Facades\ThemeOption::class,
        'Widget' => App\Packages\Widget\Facades\Widget::class,
        'WidgetGroup' => App\Packages\Widget\Facades\WidgetGroup::class,
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
