<?php

namespace App\Plugins\Language\Forms\Settings;

use App\Core\Base\Forms\FieldOptions\AlertFieldOption;
use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\MultiChecklistFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\FieldOptions\RadioFieldOption;
use App\Core\Base\Forms\Fields\AlertField;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\MultiCheckListField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Base\Forms\Fields\RadioField;
use App\Core\Base\Forms\FormAbstract;
use App\Plugins\Language\Facades\Language;
use App\Plugins\Language\Http\Requests\Settings\LanguageSettingRequest;
use App\Core\Setting\Models\Setting;

class LanguageSettingForm extends FormAbstract
{
    public function setup(): void
    {
        $hiddenLanguagesSetting = json_decode(setting('language_hide_languages', '[]'), true);
        $hiddenLanguages = is_array($hiddenLanguagesSetting) ? $hiddenLanguagesSetting : [];

        $this
            ->model(Setting::class)
            ->setUrl(route('languages.settings'))
            ->setMethod('POST')
            ->setFormOption('class', 'language-settings-form')
            ->contentOnly()
            ->setValidatorClass(LanguageSettingRequest::class)
            ->add(
                'language_hide_default',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/language::language.language_hide_default'))
                    ->value(setting('language_hide_default', true))
            )
            ->add(
                'language_display',
                RadioField::class,
                RadioFieldOption::make()
                    ->label(trans('plugins/language::language.language_display'))
                    ->choices([
                        'all' => trans('plugins/language::language.language_display_all'),
                        'flag' => trans('plugins/language::language.language_display_flag_only'),
                        'name' => trans('plugins/language::language.language_display_name_only'),
                    ])
                    ->selected(setting('language_display', 'all'))
            )
            ->add(
                'language_switcher_display',
                RadioField::class,
                RadioFieldOption::make()
                    ->label(trans('plugins/language::language.switcher_display'))
                    ->choices([
                        'dropdown' => trans('plugins/language::language.language_switcher_display_dropdown'),
                        'list' => trans('plugins/language::language.language_switcher_display_list'),
                    ])
                    ->selected(setting('language_switcher_display', 'dropdown'))
            );

        if ($languageActives = Language::getActiveLanguage()) {
            $choices = [];
            foreach ($languageActives as $language) {
                if (! $language->lang_is_default) {
                    $choices[$language->lang_id] = $language->lang_name;
                }
            }

            if ($choices) {
                $this
                    ->add(
                        'language_hide_languages[]',
                        MultiCheckListField::class,
                        MultiChecklistFieldOption::make()
                            ->label(trans('plugins/language::language.hide_languages'))
                            ->choices($choices)
                            ->selected($hiddenLanguages)
                    );
            }
        }

        $hiddenLanguagesCount = count($hiddenLanguages);
        $hiddenLanguagesText = Language::getHiddenLanguageText();

        if ($hiddenLanguagesCount === 1) {
            $hideLanguagesTranslation = trans(
                'plugins/language::language.hide_languages_helper_display_hidden_singular',
                ['language' => $hiddenLanguagesText]
            );
        } else {
            $hideLanguagesTranslation = trans(
                'plugins/language::language.hide_languages_helper_display_hidden_plural',
                [
                    'language' => $hiddenLanguagesText,
                    'count' => $hiddenLanguagesCount,
                ]
            );
        }

        if ($hiddenLanguagesCount === 0) {
            $hideLanguagesTranslation = trans('plugins/language::language.hide_languages_helper_display_hidden_zero');
        }

        $this
            ->add(
                'hide_languages_helper_display_hidden',
                AlertField::class,
                AlertFieldOption::make()
                    ->content($hideLanguagesTranslation)
            )
            ->add(
                'language_auto_detect_user_language',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/language::language.language_auto_detect_user_language'))
                    ->helperText(trans('plugins/language::language.language_auto_detect_user_language_helper'))
                    ->value(setting('language_auto_detect_user_language', false))
            )
            ->add(
                'button_action',
                HtmlField::class,
                HtmlFieldOption::make()->view('plugins/language::forms.button-action')
            );
    }
}
