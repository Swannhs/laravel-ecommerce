<?php

namespace App\Plugins\Language\Http\Controllers\Settings;

use App\Core\Base\Http\Responses\BaseHttpResponse;
use App\Plugins\Language\Facades\Language;
use App\Plugins\Language\Http\Requests\Settings\LanguageSettingRequest;
use App\Core\Setting\Http\Controllers\SettingController;

class LanguageSettingController extends SettingController
{
    public function update(LanguageSettingRequest $request): BaseHttpResponse
    {
        $response = $this->performUpdate([
            ...$request->validated(),
            'language_hide_languages' => $request->input('language_hide_languages', []),
        ]);

        Language::clearCache();

        return $response;
    }
}
