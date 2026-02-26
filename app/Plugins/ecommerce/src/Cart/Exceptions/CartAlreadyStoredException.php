<?php

namespace App\Plugins\Ecommerce\Cart\Exceptions;

use App\Core\Base\Contracts\Exceptions\IgnoringReport;
use RuntimeException;

class CartAlreadyStoredException extends RuntimeException implements IgnoringReport
{
}
