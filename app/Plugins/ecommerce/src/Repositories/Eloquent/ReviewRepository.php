<?php

namespace App\Plugins\Ecommerce\Repositories\Eloquent;

use App\Plugins\Ecommerce\Repositories\Interfaces\ReviewInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Support\Facades\DB;

class ReviewRepository extends RepositoriesAbstract implements ReviewInterface
{
    public function getGroupedByProductId(int|string $productId): Collection
    {
        $data = $this->model
            ->select([DB::raw('COUNT(star) as star_count'), 'star'])
            ->where('product_id', $productId)
            ->wherePublished()
            ->groupBy('star');

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
