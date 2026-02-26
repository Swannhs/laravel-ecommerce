<?php

namespace App\Plugins\Ecommerce\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;

interface ProductCollectionInterface extends RepositoryInterface
{
    public function createSlug(string $name, int|string|null $id): string;
}
