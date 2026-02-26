<?php

namespace App\Plugins\Ecommerce\Http\Controllers\Customers;

use App\Packages\DataSynchronize\Http\Controllers\ImportController;
use App\Packages\DataSynchronize\Importer\Importer;
use App\Plugins\Ecommerce\Importers\CustomerImporter;

class ImportCustomerController extends ImportController
{
    protected function getImporter(): Importer
    {
        return CustomerImporter::make();
    }
}
