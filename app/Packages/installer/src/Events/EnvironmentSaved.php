<?php

namespace App\Packages\Installer\Events;

use App\Core\Base\Events\Event;
use Illuminate\Http\Request;

class EnvironmentSaved extends Event
{
    public function __construct(public Request $request)
    {
    }
}
