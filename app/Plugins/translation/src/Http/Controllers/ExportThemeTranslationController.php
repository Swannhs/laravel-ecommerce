<?php

namespace App\Plugins\Translation\Http\Controllers;

use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Packages\DataSynchronize\Http\Controllers\ExportController;
use App\Plugins\Translation\Exporters\ThemeTranslationExporter;

class ExportThemeTranslationController extends ExportController
{
    protected function getExporter(): Exporter
    {
        return ThemeTranslationExporter::make();
    }
}
