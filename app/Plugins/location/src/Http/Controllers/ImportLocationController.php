<?php

namespace App\Plugins\Location\Http\Controllers;

use App\Core\Base\Facades\BaseHelper;
use App\Packages\DataSynchronize\Http\Controllers\ImportController;
use App\Packages\DataSynchronize\Importer\Importer;
use App\Plugins\Location\Facades\Location;
use App\Plugins\Location\Http\Requests\ImportLocationRequest;
use App\Plugins\Location\Importers\LocationImporter;

class ImportLocationController extends ImportController
{
    protected function getImporter(): Importer
    {
        return LocationImporter::make();
    }

    public function importLocationData(ImportLocationRequest $request)
    {
        BaseHelper::maximumExecutionTimeAndMemoryLimit();

        $result = Location::downloadRemoteLocation(
            strtolower($request->input('country_code')),
            $request->boolean('continue')
        );

        return $this
            ->httpResponse()
            ->setError($result['error'])
            ->setMessage($result['message']);
    }
}
