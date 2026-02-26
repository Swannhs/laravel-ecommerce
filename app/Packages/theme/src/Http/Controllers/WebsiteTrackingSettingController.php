<?php

namespace App\Packages\Theme\Http\Controllers;

use App\Core\Setting\Http\Controllers\SettingController;
use App\Packages\Theme\Forms\Settings\WebsiteTrackingSettingForm;
use App\Packages\Theme\Http\Requests\WebsiteTrackingSettingRequest;

class WebsiteTrackingSettingController extends SettingController
{
    public function edit()
    {
        $this->pageTitle(trans('packages/theme::theme.settings.website_tracking.title'));

        return WebsiteTrackingSettingForm::create()->renderForm();
    }

    public function update(WebsiteTrackingSettingRequest $request)
    {
        $data = $request->validated();

        if (isset($data['google_tag_manager_type'])) {
            if ($data['google_tag_manager_type'] === 'code') {
                $data['google_tag_manager_type'] = 'custom';

                if (! empty($data['google_tag_manager_code']) && empty($data['custom_tracking_header_js'])) {
                    $data['custom_tracking_header_js'] = $data['google_tag_manager_code'];
                }
            }

            if ($data['google_tag_manager_type'] === 'custom' && ! empty($data['custom_tracking_header_js'])) {
                $data['google_tag_manager_code'] = null;
            }
        }

        return $this->performUpdate($data)->withUpdatedSuccessMessage();
    }
}
