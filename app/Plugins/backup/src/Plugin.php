<?php

namespace App\Plugins\Backup;

use App\Packages\PluginManagement\Abstracts\PluginOperationAbstract;
use Illuminate\Support\Facades\File;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        $backupPath = storage_path('app/backup');

        if (File::isDirectory($backupPath)) {
            File::deleteDirectory($backupPath);
        }
    }
}
