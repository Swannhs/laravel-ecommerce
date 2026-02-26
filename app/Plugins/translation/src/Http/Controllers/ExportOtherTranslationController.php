<?php

namespace App\Plugins\Translation\Http\Controllers;

use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Packages\DataSynchronize\Http\Controllers\ExportController;
use App\Plugins\Translation\Exporters\OtherTranslationExporter;

class ExportOtherTranslationController extends ExportController
{
    protected function getExporter(): Exporter
    {
        return OtherTranslationExporter::make();
    }
}
