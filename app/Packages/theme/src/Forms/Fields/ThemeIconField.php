<?php

namespace App\Packages\Theme\Forms\Fields;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FormField;

class ThemeIconField extends FormField
{
    protected function getTemplate(): string
    {
        Assets::addScriptsDirectly('vendor/core/packages/theme/js/icons-field.js');

        return 'packages/theme::fields.icons-field';
    }
}
