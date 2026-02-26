<?php

namespace App\Plugins\Ecommerce\Http\Requests\Settings;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class FlashSaleSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'flash_sale_enabled' => [new OnOffRule()],
        ];
    }
}
