<?php

namespace App\Plugins\LanguageAdvanced\Http\Controllers;

use App\Packages\DataSynchronize\Http\Controllers\ImportController;
use App\Packages\DataSynchronize\Http\Requests\DownloadTemplateRequest;
use App\Packages\DataSynchronize\Http\Requests\ImportRequest;
use App\Packages\DataSynchronize\Importer\Importer;
use App\Plugins\LanguageAdvanced\Importers\TranslationImporterManager;

class TranslationImportController extends ImportController
{
    protected string $type;

    public function __construct(protected TranslationImporterManager $importerManager)
    {
    }

    protected function getImporter(): Importer
    {
        if ($this->type === 'model') {
            $modelClass = request()->input('class');
            if ($modelClass) {
                return $this->importerManager->getImporter($this->type)->make($modelClass);
            }
        }

        return $this->importerManager->getImporter($this->type);
    }

    public function index()
    {
        $this->type = request()->route('type');

        return parent::index();
    }

    public function validateData(ImportRequest $request)
    {
        $this->type = request()->route('type');

        return parent::validateData($request);
    }

    public function import(ImportRequest $request)
    {
        $this->type = request()->route('type');

        return parent::import($request);
    }

    public function downloadExample(DownloadTemplateRequest $request)
    {
        $this->type = request()->route('type');

        return parent::downloadExample($request);
    }
}
