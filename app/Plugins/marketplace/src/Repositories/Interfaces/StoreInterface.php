<?php

namespace App\Plugins\Marketplace\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;

interface StoreInterface extends RepositoryInterface
{
    public function handleCommissionEachCategory(array $data): array;

    public function getCommissionEachCategory(): array;
}
