<?php

namespace App\Plugins\LanguageAdvanced\Database\Seeders\Traits;

use App\Plugins\Language\Facades\Language as LanguageFacade;
use App\Core\Setting\Facades\Setting;
use App\Packages\Theme\Facades\ThemeOption;
use Illuminate\Support\Facades\File;

trait HasThemeOptionSeeder
{
    /**
     * Seed theme options for all locales
     * Loads translations from database/seeders/translations/{locale}/theme-option.json
     *
     * @param array $locales
     */
    protected function seedThemeOptions(array $locales): void
    {
        $defaultLocale = LanguageFacade::getDefaultLocaleCode();

        foreach ($locales as $locale) {
            $translations = $this->loadThemeOptionTranslations($locale);
            if (empty($translations)) {
                continue;
            }

            Setting::set(
                ThemeOption::prepareFromArray($translations, $locale, $defaultLocale)
            );
        }

        Setting::save();
    }

    /**
     * Load theme option translations from JSON file
     *
     * @param string $locale
     * @return array
     */
    protected function loadThemeOptionTranslations(string $locale): array
    {
        $path = database_path("seeders/translations/{$locale}/theme-option.json");

        if (! File::exists($path)) {
            return [];
        }

        $content = File::get($path);
        $data = json_decode($content, true);

        return $data ?: [];
    }
}
