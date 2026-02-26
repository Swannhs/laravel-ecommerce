<?php

namespace App\Core\Setting\Http\Controllers;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Setting\Forms\EmailTemplateSettingForm;
use App\Core\Setting\Http\Requests\EmailTemplateSettingRequest;
use Illuminate\Contracts\View\View;

class EmailTemplateSettingController extends SettingController
{
    public function index(): View
    {
        $this->pageTitle(trans('core/setting::setting.email.email_templates'));

        Assets::addScriptsDirectly('vendor/core/core/setting/js/email-template.js');

        $form = EmailTemplateSettingForm::create();

        return view('core/setting::email-templates', compact('form'));
    }

    public function update(EmailTemplateSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate(
            $request->validated()
        )->withUpdatedSuccessMessage();
    }
}
