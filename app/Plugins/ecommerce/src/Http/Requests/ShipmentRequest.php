<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Support\Http\Requests\Request;

class ShipmentRequest extends Request
{
    public function rules(): array
    {
        return [
            'store_id' => ['nullable', 'exists:ec_store_locators,id'],
            'tracking_id' => ['nullable', 'max:120'],
            'shipping_company_name' => ['nullable', 'string', 'max:120'],
            'tracking_link' => ['nullable', 'url', 'max:190'],
            'estimate_date_shipped' => 'nullable|date|date_format:' . BaseHelper::getDateFormat(),
            'note' => ['nullable', 'string', 'max:10000'],
        ];
    }
}
