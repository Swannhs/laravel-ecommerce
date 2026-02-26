<?php

namespace App\Core\Base\Forms\Fields;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FormField;

class MediaImagesField extends FormField
{
    protected function getTemplate(): string
    {
        Assets::addScripts(['jquery-ui']);

        return 'core/base::forms.fields.media-images';
    }
}
