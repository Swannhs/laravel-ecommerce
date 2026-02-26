<?php

namespace App\Plugins\Translation\Http\Controllers;

use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Translation\Manager;

class ReImportThemeTranslationController extends BaseController
{
    public function __invoke(Manager $manager)
    {
        $manager->updateThemeTranslations();

        return $this->httpResponse()->setMessage(trans('plugins/translation::translation.import_success_message'));
    }
}
