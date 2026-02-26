<?php

namespace App\Plugins\Location\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface CityInterface extends RepositoryInterface
{
    public function filters(?string $keyword, ?int $limit = 10, array $with = [], array $select = ['cities.*']): Collection;
}
