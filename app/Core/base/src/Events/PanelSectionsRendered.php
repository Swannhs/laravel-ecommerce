<?php

namespace App\Core\Base\Events;

use App\Core\Base\Contracts\PanelSections\Manager;
use Illuminate\Foundation\Events\Dispatchable;

class PanelSectionsRendered
{
    use Dispatchable;

    public function __construct(public Manager $panelSectionManager)
    {
    }
}
