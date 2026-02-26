<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class RepeatedType extends \Kris\LaravelFormBuilder\Fields\RepeatedType
{
    use CanSpanColumns;
}
