<?php

namespace App\Plugins\PayPalPayout\Providers;

use App\Plugins\AffiliatePro\Events\WithdrawalRequestedEvent as AffiliateWithdrawalRequestedEvent;
use App\Core\Base\Facades\Assets;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\Marketplace\Enums\PayoutPaymentMethodsEnum;
use App\Plugins\Marketplace\Models\Withdrawal;
use App\Plugins\PayPalPayout\Listeners\AffiliatePayPalPayoutListener;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\ServiceProvider;

class PayPalPayoutServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        if (! is_plugin_active('payment')) {
            return;
        }

        $this->setNamespace('plugins/paypal-payout')
            ->loadAndPublishViews()
            ->loadAndPublishTranslations()
            ->publishAssets()
            ->loadRoutes();

        // Register event listeners
        if (is_plugin_active('affiliate-pro')) {
            Event::listen(AffiliateWithdrawalRequestedEvent::class, AffiliatePayPalPayoutListener::class);
        }

        $this->app->booted(function (): void {
            add_filter(BASE_FILTER_BEFORE_RENDER_FORM, function ($form, $data) {
                if (
                    is_in_admin(true) &&
                    Auth::check() &&
                    $data->getKey() &&
                    (
                        (is_plugin_active('marketplace') && $data instanceof Withdrawal && $data->payment_channel == PayoutPaymentMethodsEnum::PAYPAL) ||
                        (is_plugin_active('affiliate-pro') && $data instanceof \App\Plugins\AffiliatePro\Models\Withdrawal && $data->payment_channel == \App\Plugins\AffiliatePro\Enums\PayoutPaymentMethodsEnum::PAYPAL)
                    )
                ) {
                    Assets::addScriptsDirectly('vendor/core/plugins/paypal-payout/js/paypal-payout.js');

                    $form
                        ->add('payout-form', 'html', [
                            'html' => view('plugins/paypal-payout::payout-form', compact('data'))->render(),
                            'label' => trans('plugins/paypal-payout::paypal-payout.automatically_payout'),
                        ]);
                }

                return $form;
            }, 123, 2);
        });
    }
}
