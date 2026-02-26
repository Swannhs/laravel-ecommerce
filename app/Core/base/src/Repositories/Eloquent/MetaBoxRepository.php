<?php

namespace App\Core\Base\Repositories\Eloquent;

use App\Core\Base\Models\BaseModel;
use App\Core\Base\Models\BaseQueryBuilder;
use App\Core\Base\Models\MetaBox;
use App\Core\Base\Repositories\Interfaces\MetaBoxInterface;
use App\Core\Support\Repositories\Eloquent\RepositoriesAbstract;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class MetaBoxRepository extends RepositoriesAbstract implements MetaBoxInterface
{
    public function __construct(protected BaseModel|BaseQueryBuilder|Builder|Model $model)
    {
        parent::__construct(new MetaBox());
    }
}
