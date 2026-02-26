<?php

namespace App\Core\Base\Forms\Fields;

use App\Core\Base\Forms\FormField;

class TimeField extends FormField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.time';
    }
}
