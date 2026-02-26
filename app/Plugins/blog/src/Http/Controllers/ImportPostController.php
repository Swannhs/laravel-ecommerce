<?php

namespace App\Plugins\Blog\Http\Controllers;

use App\Plugins\Blog\Importers\PostImporter;
use App\Packages\DataSynchronize\Http\Controllers\ImportController;
use App\Packages\DataSynchronize\Importer\Importer;

class ImportPostController extends ImportController
{
    protected function getImporter(): Importer
    {
        return PostImporter::make();
    }
}
