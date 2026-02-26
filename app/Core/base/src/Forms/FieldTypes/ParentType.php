<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

abstract class ParentType extends \Kris\LaravelFormBuilder\Fields\ParentType
{
    use CanSpanColumns;
}
