<?php

namespace App\Core\Table\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Core\Table\TableBuilder;

class TableController extends BaseController
{
    public function __construct(protected TableBuilder $tableBuilder)
    {
    }
}
