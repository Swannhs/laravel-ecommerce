<?php

namespace App\Core\Dashboard\Repositories\Interfaces;

use App\Core\Support\Repositories\Interfaces\RepositoryInterface;
use Illuminate\Database\Eloquent\Collection;

interface DashboardWidgetSettingInterface extends RepositoryInterface
{
    public function getListWidget(): Collection;
}
