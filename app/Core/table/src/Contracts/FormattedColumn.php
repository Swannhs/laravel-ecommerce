<?php

namespace App\Core\Table\Contracts;

use App\Core\Base\Contracts\BaseModel;
use App\Core\Table\Abstracts\TableAbstract;
use stdClass;

interface FormattedColumn
{
    public function formattedValue($value): ?string;

    public function renderCell(BaseModel|stdClass|array $item, TableAbstract $table): string;
}
