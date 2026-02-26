<?php

namespace App\Plugins\Faq\Http\Controllers\Settings;

use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Faq\Forms\Settings\FaqSettingForm;
use App\Plugins\Faq\Http\Requests\Settings\FaqSettingRequest;
use App\Core\Setting\Http\Controllers\SettingController;

class FaqSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/base::base.panel.others'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/faq::faq.settings.title'));

        return FaqSettingForm::create()->renderForm();
    }

    public function update(FaqSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
