<?php

namespace App\Plugins\Location\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface StateInterface extends RepositoryInterface
{
    public function filters(?string $keyword, ?int $limit = 10, array $with = [], array $select = ['states.*']): Collection;
}
