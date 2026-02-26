<?php

namespace App\Core\ACL\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;

interface UserInterface extends RepositoryInterface
{
    public function getUniqueUsernameFromEmail(string $email): string;
}
