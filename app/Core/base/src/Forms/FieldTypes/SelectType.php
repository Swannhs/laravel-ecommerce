<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class SelectType extends \Kris\LaravelFormBuilder\Fields\SelectType
{
    use CanSpanColumns;
}
