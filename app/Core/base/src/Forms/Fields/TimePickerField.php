<?php

namespace App\Core\Base\Forms\Fields;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Forms\FormField;

class TimePickerField extends FormField
{
    protected function getTemplate(): string
    {
        Assets::addScripts(['timepicker'])
            ->addStyles(['timepicker']);

        return 'core/base::forms.fields.time-picker';
    }
}
