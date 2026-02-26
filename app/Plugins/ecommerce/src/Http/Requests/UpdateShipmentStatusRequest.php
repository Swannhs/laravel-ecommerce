<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Plugins\Ecommerce\Enums\ShippingStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateShipmentStatusRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => ['required', Rule::in(ShippingStatusEnum::values())],
        ];
    }
}
