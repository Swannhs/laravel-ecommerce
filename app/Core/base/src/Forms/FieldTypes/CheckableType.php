<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class CheckableType extends \Kris\LaravelFormBuilder\Fields\CheckableType
{
    use CanSpanColumns;
}
