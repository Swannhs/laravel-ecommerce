<?php

namespace App\Plugins\Marketplace\Http\Controllers\Fronts;

use App\Core\Base\Facades\Assets;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Marketplace\Tables\ReviewTable;

class ReviewController extends BaseController
{
    public function index(ReviewTable $table)
    {
        $this->pageTitle(trans('plugins/ecommerce::review.name'));

        Assets::addStylesDirectly('vendor/core/plugins/ecommerce/css/review.css');

        return $table->renderTable();
    }
}
