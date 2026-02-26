<?php

namespace App\Core\Setting\Http\Controllers;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Facades\EmailHandler;
use App\Core\Base\Supports\Breadcrumb;
use App\Core\Setting\Http\Requests\EmailTemplateRequest;
use Illuminate\Contracts\View\View;
use Throwable;

class EmailTemplateController extends SettingController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()->add(
            trans('core/setting::setting.email.email_templates'),
            route('settings.email.template')
        );
    }

    public function index(string $type, string $module, string $template): View
    {
        Assets::addScriptsDirectly('vendor/core/core/setting/js/email-template.js');

        $title = config(sprintf('%s.%s.email.templates.%s.title', $type, $module, $template), '');

        if ($title === '') {
            $title = data_get(EmailHandler::getTemplateData($type, $module, $template), 'title', '');
        }

        $this->pageTitle(trans($title));

        $emailContent = get_setting_email_template_content($type, $module, $template);
        $emailSubject = get_setting_email_subject($type, $module, $template);
        $pluginData = [
            'type' => $type,
            'name' => $module,
            'template_file' => $template,
        ];

        $routeParams = [$type, $module, $template];

        abort_if(count($routeParams) !== 3, 404);

        try {
            $updateUrl = route('settings.email.template.update', $routeParams);
            $restoreUrl = route('settings.email.template.restore', $routeParams);
        } catch (Throwable $exception) {
            BaseHelper::logError($exception);
            abort(404);
        }

        return view('core/setting::email-template-edit', compact('emailContent', 'emailSubject', 'pluginData', 'updateUrl', 'restoreUrl'));
    }

    public function update(EmailTemplateRequest $request)
    {
        if ($request->has('email_subject_key')) {
            $this->saveSettings([
                $request->input('email_subject_key') => $request->input('email_subject'),
            ]);
        }

        $templatePath = get_setting_email_template_path($request->input('module'), $request->input('template_file'));

        BaseHelper::saveFileData($templatePath, $request->input('email_content'), false);

        return $this
            ->httpResponse()
            ->withUpdatedSuccessMessage();
    }
}
