<?php

namespace App\Plugins\LanguageAdvanced\Http\Controllers;

use App\Packages\DataSynchronize\Exporter\Exporter;
use App\Packages\DataSynchronize\Http\Controllers\ExportController;
use App\Plugins\LanguageAdvanced\Exporters\TranslationExporterManager;

class TranslationExportController extends ExportController
{
    protected TranslationExporterManager $exporterManager;

    protected ?string $type;

    public function __construct(TranslationExporterManager $exporterManager)
    {
        $this->exporterManager = $exporterManager;
        $this->type = request()->route('type');
    }

    protected function getExporter(): Exporter
    {
        return $this->exporterManager->getExporter($this->type);
    }
}
