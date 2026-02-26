<?php

namespace App\Core\Setting\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use Illuminate\Contracts\View\View;

class HomeSettingController extends BaseController
{
    public function index(): View
    {
        $this->pageTitle(trans('core/setting::setting.title'));

        return view('core/setting::index');
    }
}
