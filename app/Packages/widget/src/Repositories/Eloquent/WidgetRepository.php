<?php

namespace App\Packages\Widget\Repositories\Eloquent;

use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use App\Packages\Widget\Repositories\Interfaces\WidgetInterface;
use Illuminate\Database\Eloquent\Collection;

class WidgetRepository extends RepositoriesAbstract implements WidgetInterface
{
    public function getByTheme(string $theme): Collection
    {
        $data = $this->model->where('theme', $theme)->get();
        $this->resetModel();

        return $data;
    }
}
