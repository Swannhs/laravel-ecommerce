<?php

namespace App\Core\Base\Forms\Fields;

use App\Core\Base\Forms\FieldTypes\SelectType;

class UiSelectorField extends SelectType
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.ui-selector';
    }
}
