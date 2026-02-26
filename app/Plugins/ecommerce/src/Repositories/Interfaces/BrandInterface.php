<?php

namespace App\Plugins\Ecommerce\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface BrandInterface extends RepositoryInterface
{
    public function getAll(array $condition = []): Collection;
}
