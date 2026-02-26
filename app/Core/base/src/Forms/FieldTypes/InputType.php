<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class InputType extends \Kris\LaravelFormBuilder\Fields\InputType
{
    use CanSpanColumns;
}
