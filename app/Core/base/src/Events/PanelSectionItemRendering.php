<?php

namespace App\Core\Base\Events;

use App\Core\Base\Contracts\PanelSections\PanelSectionItem;
use Illuminate\Foundation\Events\Dispatchable;

class PanelSectionItemRendering
{
    use Dispatchable;

    public function __construct(public PanelSectionItem $item)
    {
    }
}
