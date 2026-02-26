<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class ChildFormType extends \Kris\LaravelFormBuilder\Fields\ChildFormType
{
    use CanSpanColumns;
}
