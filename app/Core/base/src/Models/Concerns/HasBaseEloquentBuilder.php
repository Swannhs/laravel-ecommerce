<?php

namespace App\Core\Base\Models\Concerns;

use App\Core\Base\Models\BaseQueryBuilder;

trait HasBaseEloquentBuilder
{
    public function newEloquentBuilder($query): BaseQueryBuilder
    {
        return new BaseQueryBuilder($query);
    }
}
