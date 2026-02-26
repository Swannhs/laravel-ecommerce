<?php

namespace App\Core\Base\Exceptions;

use App\Core\Base\Contracts\Exceptions\IgnoringReport;
use Illuminate\Http\Client\ConnectionException;

class CouldNotConnectToLicenseServerException extends ConnectionException implements IgnoringReport
{
}
