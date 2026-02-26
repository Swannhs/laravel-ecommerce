<?php

namespace App\Plugins\Translation\Http\Controllers;

use App\Packages\DataSynchronize\Http\Controllers\ImportController;
use App\Packages\DataSynchronize\Importer\Importer;
use App\Plugins\Translation\Importers\OtherTranslationImporter;

class ImportOtherTranslationController extends ImportController
{
    protected function getImporter(): Importer
    {
        return OtherTranslationImporter::make();
    }
}
