<?php

namespace App\Core\Base\Forms\Fields;

use App\Core\Base\Forms\FormField;

class FileField extends FormField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.file';
    }
}
