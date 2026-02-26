<?php

namespace App\Plugins\Blog\Http\Controllers\Settings;

use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Core\Base\Supports\Breadcrumb;
use App\Plugins\Blog\Forms\Settings\BlogSettingForm;
use App\Plugins\Blog\Http\Requests\Settings\BlogSettingRequest;
use App\Core\Setting\Http\Controllers\SettingController;

class BlogSettingController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('core/base::base.panel.others'));
    }

    public function edit()
    {
        $this->pageTitle(trans('plugins/blog::base.settings.title'));

        return BlogSettingForm::create()->renderForm();
    }

    public function update(BlogSettingRequest $request): BaseHttpResponse
    {
        return $this->performUpdate($request->validated());
    }
}
