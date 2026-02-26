<?php

namespace App\Plugins\Captcha\Forms\Fields;

use App\Core\Base\Forms\FormField;

class MathCaptchaField extends FormField
{
    protected function getTemplate(): string
    {
        return 'plugins/captcha::forms.fields.math-captcha';
    }
}
