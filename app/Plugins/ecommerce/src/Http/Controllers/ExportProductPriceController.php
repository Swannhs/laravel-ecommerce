<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Packages\DataSynchronize\Http\Controllers\ExportController;
use App\Plugins\Ecommerce\Exporters\ProductPriceExporter;

class ExportProductPriceController extends ExportController
{
    protected function allowsSelectColumns(): bool
    {
        return false;
    }

    protected function getExporter(): Exporter
    {
        return ProductPriceExporter::make();
    }
}
