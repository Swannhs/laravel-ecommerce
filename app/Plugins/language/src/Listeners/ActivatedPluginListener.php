<?php

namespace App\Plugins\Language\Listeners;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\Language\Plugin;
use Exception;

class ActivatedPluginListener
{
    public function handle(): void
    {
        try {
            Plugin::activated();
        } catch (Exception $exception) {
            BaseHelper::logError($exception);
        }
    }
}
