<?php

namespace App\Plugins\Marketplace\Forms;

use App\Plugins\Ecommerce\Forms\SpecificationTableForm as BaseSpecificationTableForm;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;

class SpecificationTableForm extends BaseSpecificationTableForm
{
    public function setup(): void
    {
        parent::setup();

        $this->template(MarketplaceHelper::viewPath('vendor-dashboard.forms.base'));
    }
}
