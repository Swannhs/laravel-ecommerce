<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class ButtonType extends \Kris\LaravelFormBuilder\Fields\ButtonType
{
    use CanSpanColumns;
}
