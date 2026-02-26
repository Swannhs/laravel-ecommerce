<?php

namespace App\Plugins\Ecommerce\Services;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Location\Models\Country;
use Illuminate\Support\Arr;

class HandleSetCountryForPaymentCheckout
{
    public function execute(array $sessionCheckoutData): void
    {
        add_filter('payment_checkout_country', function ($default) use ($sessionCheckoutData) {
            if ($country = Arr::get($sessionCheckoutData, 'country')) {
                if (EcommerceHelper::loadCountriesStatesCitiesFromPluginLocation()) {
                    $country = Country::query()
                        ->where('id', $country)
                        ->value('code');
                }

                return $country;
            }

            return $default;
        }, 999);
    }
}
