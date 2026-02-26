<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Plugins\Ecommerce\Enums\ShippingCodStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateShipmentCodStatusRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => ['required', Rule::in(ShippingCodStatusEnum::values())],
        ];
    }
}
