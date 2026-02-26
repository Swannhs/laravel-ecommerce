<?php

namespace App\Plugins\Ecommerce\Http\Requests\Settings;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class ShippingSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'hide_other_shipping_options_if_it_has_free_shipping' => new OnOffRule(),
            'disable_shipping_options' => new OnOffRule(),
            'sort_shipping_options_direction' => ['nullable', 'in:price_lower_to_higher,price_higher_to_lower'],
        ];
    }
}
