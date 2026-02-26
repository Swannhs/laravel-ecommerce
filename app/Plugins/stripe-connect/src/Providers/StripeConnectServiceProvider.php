<?php

namespace App\Plugins\StripeConnect\Providers;

use App\Plugins\AffiliatePro\Enums\PayoutPaymentMethodsEnum as AffiliatePayoutPaymentMethodsEnum;
use App\Plugins\AffiliatePro\Facades\AffiliateHelper;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\TextField;
use App\Core\Base\Supports\ServiceProvider;
use App\Core\Base\Traits\LoadAndPublishDataTrait;
use App\Plugins\Ecommerce\Models\Customer;
use App\Plugins\Marketplace\Enums\PayoutPaymentMethodsEnum;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Plugins\Marketplace\Forms\PayoutInformationForm;
use Illuminate\Support\Arr;

class StripeConnectServiceProvider extends ServiceProvider
{
    use LoadAndPublishDataTrait;

    public function boot(): void
    {
        if (! is_plugin_active('payment') || ! is_plugin_active('stripe')) {
            return;
        }

        $this
            ->setNamespace('plugins/stripe-connect')
            ->loadAndPublishTranslations()
            ->loadAndPublishViews()
            ->loadMigrations()
            ->loadRoutes();

        $this->app->register(EventServiceProvider::class);

        $this->app->booted(function (): void {
            if (! get_payment_setting('secret', STRIPE_PAYMENT_METHOD_NAME)) {
                return;
            }

            add_filter(BASE_FILTER_ENUM_ARRAY, function (array $data, string $class) {
                if ($class === PayoutPaymentMethodsEnum::class || $class === AffiliatePayoutPaymentMethodsEnum::class) {
                    $data['STRIPE'] = 'stripe';
                }

                return $data;
            }, 999, 2);

            add_filter(BASE_FILTER_ENUM_LABEL, function (string $label, string $class) {
                if (($class === PayoutPaymentMethodsEnum::class || $class === AffiliatePayoutPaymentMethodsEnum::class) && $label === 'stripe') {
                    $label = 'Stripe';
                }

                return $label;
            }, 999, 2);

            add_filter('marketplace_payout_methods', function (array $data) {
                $data['stripe'] = [
                    'is_enabled' => (bool) Arr::get(MarketplaceHelper::getSetting('payout_methods'), 'stripe', true),
                    'key' => 'stripe',
                    'label' => 'Stripe',
                    'fields' => [],
                ];

                return $data;
            });

            if (is_plugin_active('affiliate-pro')) {
                add_filter('affiliate_pro_payout_methods', function (array $data) {
                    $data['stripe'] = [
                        'is_enabled' => (bool) Arr::get(AffiliateHelper::getSetting('payout_methods'), 'stripe', true),
                        'key' => 'stripe',
                        'label' => 'Stripe',
                        'fields' => [],
                    ];

                    return $data;
                });
            }

            add_filter('marketplace_withdrawal_payout_info', function (?string $html) {
                if (is_in_admin(true) || auth('customer')->user()->vendorInfo->payout_payment_method !== 'stripe') {
                    return $html;
                }

                return $html . view('plugins/stripe-connect::withdrawal-payout-info');
            }, 999);

            if (is_plugin_active('marketplace')) {
                PayoutInformationForm::extend(function (PayoutInformationForm $form): void {
                    /**
                     * @var Customer $customer
                     */
                    $customer = $form->getModel();

                    $form->when(! is_in_admin(true), function (PayoutInformationForm $form) use ($customer): void {
                        $form->addAfter(
                            'payout_payment_method',
                            'stripe_connect',
                            HtmlField::class,
                            HtmlFieldOption::make()
                                ->collapsible(
                                    'payout_payment_method',
                                    'stripe',
                                    $customer->vendorInfo->payout_payment_method
                                )
                                ->content(view('plugins/stripe-connect::stripe-connect', compact('customer')))
                        );
                    }, function (PayoutInformationForm $form) use ($customer): void {
                        $form->when(
                            $customer->stripe_account_id,
                            function (PayoutInformationForm $form) use ($customer): void {
                                $form->addAfter(
                                    'payout_payment_method',
                                    'stripe_account_id',
                                    TextField::class,
                                    TextFieldOption::make()
                                        ->label(trans('plugins/stripe-connect::stripe-connect.stripe_account_id'))
                                        ->value($customer->stripe_account_id)
                                        ->disabled()
                                );
                            }
                        );
                    });
                });
            }
        });
    }
}
