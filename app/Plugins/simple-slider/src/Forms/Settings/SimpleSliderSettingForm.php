<?php

namespace App\Plugins\SimpleSlider\Forms\Settings;

use App\Core\Base\Forms\FieldOptions\HtmlFieldOption;
use App\Core\Base\Forms\FieldOptions\OnOffFieldOption;
use App\Core\Base\Forms\Fields\HtmlField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Setting\Forms\SettingForm;
use App\Plugins\SimpleSlider\Http\Requests\Settings\SimpleSliderSettingRequest;

class SimpleSliderSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/simple-slider::simple-slider.settings.title'))
            ->setSectionDescription(trans('plugins/simple-slider::simple-slider.settings.description'))
            ->setValidatorClass(SimpleSliderSettingRequest::class)
            ->add(
                'simple_slider_using_assets',
                OnOffCheckboxField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/simple-slider::simple-slider.settings.using_assets'))
                    ->defaultValue((bool) setting('simple_slider_using_assets', true))
            )
            ->add(
                'simple_slider_assets',
                HtmlField::class,
                HtmlFieldOption::make()
                    ->content(view('plugins/simple-slider::partials.simple-slider-asset-fields')->render())
            );
    }
}
