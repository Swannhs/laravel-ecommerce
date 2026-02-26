<?php

namespace App\Core\Base\Http\Controllers\Concerns;

use App\Core\Base\Http\Responses\BaseHttpResponse;

trait HasHttpResponse
{
    public function httpResponse(): BaseHttpResponse
    {
        return BaseHttpResponse::make();
    }
}
