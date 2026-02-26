<?php

namespace App\Core\Table\Columns\Concerns;

enum CopyablePosition: string
{
    case Start = 'start';

    case End = 'end';
}
