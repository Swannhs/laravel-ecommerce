<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Customers;

use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Packages\DataSynchronize\Http\Controllers\ExportController;
use App\Plugins\Ecommerce\Exporters\CustomerExporter;

class ExportCustomerController extends ExportController
{
    protected function getExporter(): Exporter
    {
        return CustomerExporter::make();
    }
}
