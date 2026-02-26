<?php

namespace App\Plugins\Ads\Repositories\Eloquent;

use App\Plugins\Ads\Repositories\Interfaces\AdsInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class AdsRepository extends RepositoriesAbstract implements AdsInterface
{
    public function getAll(): Collection
    {
        // @phpstan-ignore-next-line
        $data = $this->model
            ->wherePublished()
            ->notExpired()
            ->with(['metadata']);

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
