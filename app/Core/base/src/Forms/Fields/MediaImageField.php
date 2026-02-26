<?php

namespace App\Core\Base\Forms\Fields;

use App\Core\Base\Forms\FieldTypes\FormField;

class MediaImageField extends FormField
{
    protected bool $useDefaultFieldClass = false;

    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.media-image';
    }
}
