<?php

namespace App\Plugins\SimpleSlider\Http\Controllers\Settings;

use App\Core\Base\Supports\Breadcrumb;
use App\Core\Setting\Http\Controllers\SettingController;
use App\Plugins\SimpleSlider\Forms\Settings\SimpleSliderSettingForm;
use App\Plugins\SimpleSlider\Http\Requests\Settings\SimpleSliderSettingRequest;

class SimpleSliderSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/base::base.panel.others'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/simple-slider::simple-slider.settings.title'));

        return SimpleSliderSettingForm::create()->renderForm();
    }

    public function update(SimpleSliderSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
