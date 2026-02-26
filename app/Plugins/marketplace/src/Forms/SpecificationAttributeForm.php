<?php

namespace App\Plugins\Marketplace\Forms;

use App\Plugins\Ecommerce\Forms\SpecificationAttributeForm as BaseSpecificationAttributeForm;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;

class SpecificationAttributeForm extends BaseSpecificationAttributeForm
{
    public function setup(): void
    {
        parent::setup();

        $this->template(MarketplaceHelper::viewPath('vendor-dashboard.forms.base'));
    }
}
