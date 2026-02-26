<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class StaticType extends \Kris\LaravelFormBuilder\Fields\StaticType
{
    use CanSpanColumns;
}
