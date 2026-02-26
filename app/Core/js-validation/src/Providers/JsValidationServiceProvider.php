<?php

namespace App\Core\JsValidation\Providers;

use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Core\JsValidation\Javascript\ValidatorHandler;
use App\Core\JsValidation\JsValidatorFactory;
use App\Core\JsValidation\RemoteValidationMiddleware;
use Illuminate\Contracts\Http\Kernel;

class JsValidationServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        $this
            ->setNamespace('core/js-validation')
            ->loadAndPublishConfigurations(['js-validation'])
            ->loadAndPublishViews()
            ->publishAssets();

        $this->bootstrapValidator();

        if ($this->app['config']->get('core.js-validation.js-validation.disable_remote_validation') === false) {
            $this->app[Kernel::class]->pushMiddleware(RemoteValidationMiddleware::class);
        }
    }

    protected function bootstrapValidator(): void
    {
        $callback = function () {
            return true;
        };

        $this->app['validator']->extend(ValidatorHandler::JS_VALIDATION_DISABLE, $callback);
    }

    public function register(): void
    {
        $this->app->singleton('js-validator', function ($app) {
            $config = $app['config']->get('core.js-validation.js-validation');

            return new JsValidatorFactory($app, $config);
        });
    }
}
