<?php

namespace App\Plugins\Contact\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface ContactInterface extends RepositoryInterface
{
    public function getUnread(array $select = ['*']): Collection;

    public function countUnread(): int;
}
