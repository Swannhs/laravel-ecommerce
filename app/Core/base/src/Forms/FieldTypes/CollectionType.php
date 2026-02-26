<?php

namespace App\Core\Base\Forms\FieldTypes;

use App\Core\Base\Traits\Forms\CanSpanColumns;

class CollectionType extends \Kris\LaravelFormBuilder\Fields\CollectionType
{
    use CanSpanColumns;
}
