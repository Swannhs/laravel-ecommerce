<?php

namespace App\Plugins\LanguageAdvanced\Listeners;

use App\Core\Base\Facades\BaseHelper;
use App\Plugins\LanguageAdvanced\Plugin;
use Exception;

class PriorityLanguageAdvancedPluginListener
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
