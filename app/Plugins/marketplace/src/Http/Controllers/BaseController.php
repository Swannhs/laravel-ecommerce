<?php

namespace App\Plugins\Marketplace\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController as Controller;
use App\Core\Base\Supports\Breadcrumb;

abstract class BaseController extends Controller
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()
            ->add(trans('plugins/marketplace::marketplace.name'));
    }
}
