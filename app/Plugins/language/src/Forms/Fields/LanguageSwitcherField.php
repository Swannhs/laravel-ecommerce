<?php

namespace App\Plugins\Language\Forms\Fields;

use App\Core\Base\Forms\FormField;

class LanguageSwitcherField extends FormField
{
    protected function getTemplate(): string
    {
        return 'plugins/language::forms.fields.language-switcher';
    }
}
