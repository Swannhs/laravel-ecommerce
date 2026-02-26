<?php

namespace App\Plugins\Ecommerce\Repositories\Eloquent;

use App\Plugins\Ecommerce\Repositories\Interfaces\BrandInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class BrandRepository extends RepositoriesAbstract implements BrandInterface
{
    public function getAll(array $condition = []): Collection
    {
        $data = $this->model
            ->where($condition)
            ->latest('is_featured')
            ->oldest('name');

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
