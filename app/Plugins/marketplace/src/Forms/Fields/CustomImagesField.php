<?php

namespace App\Plugins\Marketplace\Forms\Fields;

use App\Core\Base\Forms\FormField;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;

class CustomImagesField extends FormField
{
    protected function getTemplate(): string
    {
        return MarketplaceHelper::viewPath('vendor-dashboard.forms.fields.custom-images');
    }
}
