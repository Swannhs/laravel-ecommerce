<?php

namespace App\Plugins\Faq\Forms\Settings;

use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Plugins\Faq\Http\Requests\Settings\FaqSettingRequest;
use App\Core\Setting\Forms\SettingForm;

class FaqSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/faq::faq.settings.title'))
            ->setSectionDescription(trans('plugins/faq::faq.settings.description'))
            ->setValidatorClass(FaqSettingRequest::class)
            ->add(
                'enable_faq_schema',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/faq::faq.settings.enable_faq_schema'))
                    ->defaultValue((bool) setting('enable_faq_schema', false))
                    ->helperText(trans('plugins/faq::faq.settings.enable_faq_schema_description', [
                        'url' => sprintf('<a href="%s">%s</a>', $url = 'https://developers.google.com/search/docs/data-types/faqpage', $url),
                    ]))
            );
    }
}
