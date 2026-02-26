<?php

namespace App\Plugins\Marketplace\Repositories\Eloquent;

use App\Plugins\Marketplace\Models\Store;
use App\Plugins\Marketplace\Repositories\Interfaces\StoreInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;

class StoreRepository extends RepositoriesAbstract implements StoreInterface
{
    public function handleCommissionEachCategory(array $data): array
    {
        return Store::handleCommissionEachCategory($data);
    }

    public function getCommissionEachCategory(): array
    {
        return Store::getCommissionEachCategory();
    }
}
