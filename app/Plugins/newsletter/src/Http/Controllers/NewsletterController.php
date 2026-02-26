<?php

namespace App\Plugins\Newsletter\Http\Controllers;

use App\Core\Base\Http\Actions\DeleteResourceAction;
use App\Core\Base\Http\Controllers\BaseController;
use App\Plugins\Newsletter\Models\Newsletter;
use App\Plugins\Newsletter\Tables\NewsletterTable;

class NewsletterController extends BaseController
{
    public function index(NewsletterTable $dataTable)
    {
        $this->pageTitle(trans('plugins/newsletter::newsletter.name'));

        return $dataTable->renderTable();
    }

    public function destroy(Newsletter $newsletter)
    {
        return DeleteResourceAction::make($newsletter);
    }
}
