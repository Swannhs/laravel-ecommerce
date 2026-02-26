<?php

namespace App\Plugins\Captcha\Forms\Fields;

use App\Core\Base\Forms\FormField;

class ReCaptchaField extends FormField
{
    protected function getTemplate(): string
    {
        return 'plugins/captcha::forms.fields.recaptcha';
    }
}
