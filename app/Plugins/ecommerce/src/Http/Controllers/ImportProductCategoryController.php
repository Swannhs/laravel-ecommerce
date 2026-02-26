<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Packages\DataSynchronize\Http\Controllers\ImportController;
use App\Packages\DataSynchronize\Importer\Importer;
use App\Plugins\Ecommerce\Importers\ProductCategoryImporter;

class ImportProductCategoryController extends ImportController
{
    protected function getImporter(): Importer
    {
        return ProductCategoryImporter::make();
    }
}
