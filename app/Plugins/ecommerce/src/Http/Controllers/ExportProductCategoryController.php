<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Packages\DataSynchronize\Http\Controllers\ExportController;
use App\Plugins\Ecommerce\Exporters\ProductCategoryExporter;

class ExportProductCategoryController extends ExportController
{
    protected function getExporter(): Exporter
    {
        return ProductCategoryExporter::make();
    }
}
