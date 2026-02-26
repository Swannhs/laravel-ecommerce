<?php

namespace App\Plugins\Ecommerce\Http\Controllers;

use App\Packages\DataSynchronize\Http\Controllers\ImportController;
use App\Packages\DataSynchronize\Importer\Importer;
use App\Plugins\Ecommerce\Importers\ProductImporter;
use Illuminate\Http\Request;

class ImportProductController extends ImportController
{
    protected function getImporter(): Importer
    {
        return ProductImporter::make();
    }

    protected function prepareImporter(Request $request): Importer
    {
        /**
         * @var ProductImporter $importer
         */
        $importer= parent::prepareImporter($request);

        return $importer->setImportType($request->input('type'));
    }
}
