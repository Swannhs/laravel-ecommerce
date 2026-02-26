<?php

namespace App\Plugins\Marketplace\Http\Controllers\Fronts;

use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Packages\DataSynchronize\Http\Controllers\ExportController;
use App\Plugins\Marketplace\Exporters\ProductExporter;

class ExportProductController extends ExportController
{
    protected function getExporter(): Exporter
    {
        return ProductExporter::make();
    }
}
