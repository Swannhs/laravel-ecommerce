<?php

namespace App\Plugins\Analytics\Http\Controllers\Settings;

use App\Plugins\Analytics\Forms\AnalyticsSettingForm;
use App\Plugins\Analytics\Http\Requests\Settings\AnalyticsSettingRequest;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Base\Supports\Breadcrumb;
use App\Core\Setting\Http\Controllers\SettingController;

class AnalyticsSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/base::base.panel.others'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/analytics::analytics.settings.title'));

        return AnalyticsSettingForm::create()->renderForm();
    }

    public function update(AnalyticsSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
