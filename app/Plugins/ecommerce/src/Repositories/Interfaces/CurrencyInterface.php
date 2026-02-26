<?php

namespace App\Plugins\Ecommerce\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface CurrencyInterface extends RepositoryInterface
{
    public function getAllCurrencies(): Collection;
}
