<?php

namespace App\Packages\Theme\ThemeOption\Fields;

use App\Packages\Theme\ThemeOption\ThemeOptionField;

class MediaImageField extends ThemeOptionField
{
    public function fieldType(): string
    {
        return 'mediaImage';
    }
}
