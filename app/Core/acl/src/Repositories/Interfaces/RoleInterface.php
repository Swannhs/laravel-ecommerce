<?php

namespace App\Core\ACL\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;

interface RoleInterface extends RepositoryInterface
{
    public function createSlug(string $name, int|string $id): string;
}
