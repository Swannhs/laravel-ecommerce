<?php

namespace App\Plugins\Contact\Http\Controllers\Settings;

use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Contact\Forms\Settings\ContactSettingForm;
use App\Plugins\Contact\Http\Requests\Settings\ContactSettingRequest;
use App\Core\Setting\Http\Controllers\SettingController;
use Illuminate\Support\Arr;

class ContactSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/base::base.panel.others'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/contact::contact.settings.title'));

        return ContactSettingForm::create()->renderForm();
    }

    public function update(ContactSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate(Arr::except($request->validated(), [
            'receiver_emails_for_validation',
            'blacklist_keywords_for_validation',
        ]));
    }
}
