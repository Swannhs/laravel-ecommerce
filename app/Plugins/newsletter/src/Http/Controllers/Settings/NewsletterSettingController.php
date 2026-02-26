<?php

namespace App\Plugins\Newsletter\Http\Controllers\Settings;

use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Newsletter\Forms\NewsletterSettingForm;
use App\Plugins\Newsletter\Http\Requests\Settings\NewsletterSettingRequest;
use App\Core\Setting\Http\Controllers\SettingController;

class NewsletterSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/base::base.panel.others'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/newsletter::newsletter.settings.title'));

        return NewsletterSettingForm::create()->renderForm();
    }

    public function update(NewsletterSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
