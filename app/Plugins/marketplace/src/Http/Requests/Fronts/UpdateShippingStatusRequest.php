<?php

namespace App\Plugins\Marketplace\Http\Requests\Fronts;

use App\Plugins\Ecommerce\Enums\ShippingStatusEnum;
use App\Plugins\Marketplace\Facades\MarketplaceHelper;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateShippingStatusRequest extends Request
{
    public function rules(): array
    {
        if (MarketplaceHelper::allowVendorManageShipping()) {
            return [
                'status' => Rule::in(ShippingStatusEnum::values()),
            ];
        }

        return [
            'status' => Rule::in([ShippingStatusEnum::ARRANGE_SHIPMENT, ShippingStatusEnum::READY_TO_BE_SHIPPED_OUT]),
        ];
    }
}
