<?php

namespace App\Core\Base\Http\Controllers;

use App\Core\Base\Http\Controllers\Concerns\HasBreadcrumb;
use App\Core\Base\Http\Controllers\Concerns\HasHttpResponse;
use App\Core\Base\Http\Controllers\Concerns\HasPageTitle;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller;

class BaseController extends Controller
{
    use HasBreadcrumb;
    use HasHttpResponse;
    use HasPageTitle;
    use AuthorizesRequests;
    use DispatchesJobs;
    use ValidatesRequests;
}
