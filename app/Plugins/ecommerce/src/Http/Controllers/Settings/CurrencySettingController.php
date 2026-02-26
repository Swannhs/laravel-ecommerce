<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Plugins\Ecommerce\Forms\Settings\CurrencySettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\CurrencySettingRequest;
use App\Plugins\Ecommerce\Services\StoreCurrenciesService;

class CurrencySettingController extends SettingController
{
    public function index()
    {
        $this->pageTitle(trans('plugins/ecommerce::currency.currencies'));

        $form = CurrencySettingForm::create();

        return view('plugins/ecommerce::settings.currency', compact('form'));
    }

    public function update(CurrencySettingRequest $request, StoreCurrenciesService $service)
    {
        $this->saveSettings($request->except([
            'currencies',
            'currencies_data',
            'deleted_currencies',
        ]));

        $currencies = $request->validated('currencies') ?: [];
        if ($currencies) {
            $currencies = json_decode($currencies, true);
        }

        $response = $this->httpResponse()
            ->setNextUrl(route('ecommerce.settings.currencies'));

        if (! $currencies) {
            return $response
                ->setError()
                ->setMessage(trans('plugins/ecommerce::currency.require_at_least_one_currency'));
        }

        $deletedCurrencies = $request->validated('deleted_currencies') ?: [];
        if ($deletedCurrencies) {
            $deletedCurrencies = json_decode($deletedCurrencies, true);
        }

        $storedCurrencies = $service->execute($currencies, $deletedCurrencies);

        if ($storedCurrencies['error']) {
            return $response
                ->setError()
                ->setMessage($storedCurrencies['message']);
        }

        return $response
            ->withUpdatedSuccessMessage();
    }
}
