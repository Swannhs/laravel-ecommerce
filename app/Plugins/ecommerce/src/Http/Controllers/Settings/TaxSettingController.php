<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Settings;

use App\Plugins\Ecommerce\Forms\Settings\TaxSettingForm;
use App\Plugins\Ecommerce\Http\Requests\Settings\TaxSettingRequest;
use App\Plugins\Ecommerce\Tables\TaxTable;
use Illuminate\Http\Request;

class TaxSettingController extends SettingController
{
    public function index(Request $request, TaxTable $taxTable)
    {
        if ($request->expectsJson()) {
            return $taxTable->renderTable();
        }

        $this->pageTitle(trans('plugins/ecommerce::setting.tax.name'));

        $form = TaxSettingForm::create();

        return view('plugins/ecommerce::settings.tax', compact('taxTable', 'form'));
    }

    public function update(TaxSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
