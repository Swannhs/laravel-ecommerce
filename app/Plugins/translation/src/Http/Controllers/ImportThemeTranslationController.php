<?php

namespace App\Plugins\Translation\Http\Controllers;

use App\Packages\DataSynchronize\Http\Controllers\ImportController;
use App\Packages\DataSynchronize\Importer\Importer;
use App\Plugins\Translation\Importers\ThemeTranslationImporter;

class ImportThemeTranslationController extends ImportController
{
    protected function getImporter(): Importer
    {
        return ThemeTranslationImporter::make();
    }
}
