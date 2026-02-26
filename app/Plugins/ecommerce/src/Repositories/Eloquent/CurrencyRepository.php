<?php

namespace App\Plugins\Ecommerce\Repositories\Eloquent;

use App\Plugins\Ecommerce\Repositories\Interfaces\CurrencyInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Collection;

class CurrencyRepository extends RepositoriesAbstract implements CurrencyInterface
{
    public function getAllCurrencies(): Collection
    {
        $data = $this->model
            ->orderBy('order');

        return $this->applyBeforeExecuteQuery($data)->get();
    }
}
