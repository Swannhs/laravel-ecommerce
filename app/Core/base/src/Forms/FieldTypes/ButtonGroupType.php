<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class ButtonGroupType extends \Kris\LaravelFormBuilder\Fields\ButtonGroupType
{
    use CanSpanColumns;
}
