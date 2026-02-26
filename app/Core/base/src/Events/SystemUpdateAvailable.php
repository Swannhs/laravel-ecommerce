<?php

namespace App\Core\Base\Events;

use App\Core\Base\Supports\ValueObjects\CoreProduct;
use Illuminate\Foundation\Events\Dispatchable;

class SystemUpdateAvailable
{
    use Dispatchable;

    public function __construct(public CoreProduct $coreProduct)
    {
    }
}
