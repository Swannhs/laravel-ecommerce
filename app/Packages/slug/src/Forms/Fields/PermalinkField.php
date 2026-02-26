<?php

namespace App\Packages\Slug\Forms\Fields;

use App\Core\Base\Forms\FormField;

class PermalinkField extends FormField
{
    protected function getTemplate(): string
    {
        return 'packages/slug::forms.fields.permalink';
    }
}
