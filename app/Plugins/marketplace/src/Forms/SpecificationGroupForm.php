<?php

namespace App\Plugins\Marketplace\Forms;

use App\Plugins\Ecommerce\Forms\SpecificationGroupForm as BaseSpecificationGroupForm;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;

class SpecificationGroupForm extends BaseSpecificationGroupForm
{
    public function setup(): void
    {
        parent::setup();

        $this->template(MarketplaceHelper::viewPath('vendor-dashboard.forms.base'));
    }
}
