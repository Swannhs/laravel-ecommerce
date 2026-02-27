<?php

namespace App\Plugins\Captcha\Http\Controllers\Settings;

use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Captcha\Forms\CaptchaSettingForm;
use App\Plugins\Captcha\Http\Requests\Settings\CaptchaSettingRequest;
use App\Core\Setting\Http\Controllers\SettingController;

class CaptchaSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/base::base.panel.others'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/captcha::captcha.settings.title'));

        return CaptchaSettingForm::create()->renderForm();
    }

    public function update(CaptchaSettingRequest $request): BaseHttpResponse
    {
        $request->merge([
            'enable_math_captcha_for_contact_form' => $request->input('enable_math_captcha_platformcore_contact_forms_fronts_contact_form'),
            'enable_math_captcha_for_newsletter_form' => $request->input('enable_math_captcha_platformcore_newsletter_forms_fronts_newsletter_form'),
        ]);

        return $this->performUpdate($request->validated());
    }
}
