<?php

namespace App\Packages\Menu\Repositories\Interfaces;

use App\Core\Base\Models\BaseModel;
use App\Core\Support\Repositories\Interfaces\RepositoryInterface;

interface MenuInterface extends RepositoryInterface
{
    public function findBySlug(string $slug, bool $active, array $select = [], array $with = []): ?BaseModel;

    public function createSlug(string $name): string;
}
