<?php

namespace App\Plugins\Captcha\Forms;

use App\Core\Base\Facades\Html;
use App\Core\Base\Forms\FieldOptions\AlertFieldOption;
use App\Core\Base\Forms\FieldOptions\CheckboxFieldOption;
use App\Core\Base\Forms\FieldOptions\RadioFieldOption;
use App\Core\Base\Forms\FieldOptions\SelectFieldOption;
use App\Core\Base\Forms\FieldOptions\TextFieldOption;
use App\Core\Base\Forms\Fields\AlertField;
use App\Core\Base\Forms\Fields\OnOffCheckboxField;
use App\Core\Base\Forms\Fields\RadioField;
use App\Core\Base\Forms\Fields\SelectField;
use App\Core\Base\Forms\Fields\TextField;
use App\Plugins\Captcha\Facades\Captcha;
use App\Plugins\Captcha\Http\Requests\Settings\CaptchaSettingRequest;
use App\Core\Setting\Forms\SettingForm;

class CaptchaSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/captcha::captcha.settings.title'))
            ->setSectionDescription(trans('plugins/captcha::captcha.settings.description'))
            ->setValidatorClass(CaptchaSettingRequest::class)
            ->add(
                'enable_captcha',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.enable_recaptcha'))
                    ->value($value = old('enable_captcha', Captcha::reCaptchaEnabled()))
            )
            ->addOpenCollapsible('enable_captcha', '1', $value)
            ->add(
                'captcha_setting_warning',
                AlertField::class,
                AlertFieldOption::make()
                    ->content(trans('plugins/captcha::captcha.settings.recaptcha_warning'))
                    ->type('warning')
            )
            ->add(
                'captcha_type',
                RadioField::class,
                RadioFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.type'))
                    ->choices([
                        'v2' => trans('plugins/captcha::captcha.settings.v2_description'),
                        'v3' => trans('plugins/captcha::captcha.settings.v3_description'),
                    ])
                    ->selected($captchaType = Captcha::reCaptchaType())
            )
            ->addOpenCollapsible('captcha_type', 'v3', $captchaType)
            ->add(
                'captcha_hide_badge',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.hide_badge'))
                    ->defaultValue((bool) setting('captcha_hide_badge'))
            )
            ->add(
                'captcha_show_disclaimer',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.show_disclaimer'))
                    ->defaultValue((bool) setting('captcha_show_disclaimer', false))
            )
            ->add(
                'recaptcha_score',
                SelectField::class,
                SelectFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.recaptcha_score'))
                    ->choices(Captcha::scores())
                    ->selected(setting('recaptcha_score', 0.6))
            )
            ->addCloseCollapsible('captcha_type', 'v3')
            ->add(
                'captcha_site_key',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.recaptcha_site_key'))
                    ->value(setting('captcha_site_key'))
                    ->placeholder(trans('plugins/captcha::captcha.settings.recaptcha_site_key'))
                    ->maxLength(120)
            )
            ->add(
                'captcha_secret',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.recaptcha_secret'))
                    ->value(setting('captcha_secret'))
                    ->placeholder(trans('plugins/captcha::captcha.settings.recaptcha_secret'))
                    ->maxLength(120)
                    ->helperText(trans(
                        'plugins/captcha::captcha.settings.recaptcha_credential_helper',
                        [
                            'link' => Html::link(
                                'https://www.google.com/recaptcha/admin#list',
                                trans('plugins/captcha::captcha.settings.recaptcha_credential_helper_here'),
                                ['target' => '_blank']
                            ),
                        ]
                    ))
            )
            ->addSelectFormFields('enable_recaptcha')
            ->addCloseCollapsible('enable_captcha', '1')
            ->add(
                'enable_math_captcha',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.enable_math_captcha'))
                    ->value($value = old('enable_math_captcha', Captcha::mathCaptchaEnabled()))
            )
            ->addOpenCollapsible('enable_math_captcha', '1', $value)
            ->addSelectFormFields('enable_math_captcha')
            ->addCloseCollapsible('enable_math_captcha', '1');
    }

    public function addSelectFormFields(string $key): static
    {
        foreach (Captcha::getFormsSupport() as $form => $title) {
            $this->add(
                Captcha::formSettingKey($form, $key),
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/captcha::captcha.settings.enable_for_form', ['form' => $title]))
                    ->value(Captcha::formSetting($form, $key))
            );
        }

        return $this;
    }
}
