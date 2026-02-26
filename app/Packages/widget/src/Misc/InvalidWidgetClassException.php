<?php

namespace App\Packages\Widget\Misc;

use App\Packages\Widget\AbstractWidget;
use Exception;

class InvalidWidgetClassException extends Exception
{
    protected $message = 'Widget class must extend class ' . AbstractWidget::class;
}
