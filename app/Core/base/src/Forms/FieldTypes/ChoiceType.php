<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class ChoiceType extends \Kris\LaravelFormBuilder\Fields\ChoiceType
{
    use CanSpanColumns;
}
