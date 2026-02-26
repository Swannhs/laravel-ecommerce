<?php

namespace App\Plugins\Mollie\Providers;

use App\Core\Base\Traits\LoadAndPublishDataTrait;
use Illuminate\Contracts\Support\DeferrableProvider;
use Illuminate\Support\ServiceProvider;

class MollieServiceProvider extends ServiceProvider implements DeferrableProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        if (! is_plugin_active('payment')) {
            return;
        }

        $this->setNamespace('plugins/mollie')
            ->loadHelpers()
            ->loadRoutes()
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets();

        $this->app->booted(function (): void {
            $this->app->make('config')->set([
                'mollie.key' => get_payment_setting('api_key', MOLLIE_PAYMENT_METHOD_NAME),
            ]);

            $this->app->register(HookServiceProvider::class);
        });
    }
}
