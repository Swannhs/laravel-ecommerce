<?php

namespace App\Plugins\Language\Listeners;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Language\Facades\Language;
use App\Core\Setting\Models\Setting;
use App\Packages\Theme\Events\ThemeRemoveEvent;
use App\Packages\Theme\Facades\ThemeOption;
use App\Packages\Widget\Models\Widget;
use Exception;

class ThemeRemoveListener
{
    public function handle(ThemeRemoveEvent $event): void
    {
        try {
            $languages = Language::getActiveLanguage(['lang_code']);

            foreach ($languages as $language) {
                Widget::query()
                    ->where(['theme' => Widget::getThemeName($language->lang_code, theme: $event->theme)])
                    ->delete();

                Setting::query()
                    ->where(['key', 'LIKE', ThemeOption::getOptionKey('%', $language->lang_code)])
                    ->delete();
            }
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
