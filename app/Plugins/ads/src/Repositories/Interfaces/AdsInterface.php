<?php

namespace App\Plugins\Ads\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface AdsInterface extends RepositoryInterface
{
    public function getAll(): Collection;
}
