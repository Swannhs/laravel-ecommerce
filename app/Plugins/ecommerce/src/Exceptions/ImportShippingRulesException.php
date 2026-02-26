<?php

namespace App\Plugins\Ecommerce\Exceptions;

use App\Core\Base\Contracts\Exceptions\IgnoringReport;
use Symfony\Component\HttpFoundation\Exception\BadRequestException;

class ImportShippingRulesException extends BadRequestException implements IgnoringReport
{
}
