<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class TextareaType extends \Kris\LaravelFormBuilder\Fields\TextareaType
{
    use CanSpanColumns;
}
