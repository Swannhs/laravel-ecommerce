<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class FlashSaleRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:250'],
            'end_date' => ['required', 'date'],
            'products_extra.*.price' => ['required', 'numeric'],
            'products_extra.*.quantity' => ['required', 'numeric'],
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }

    public function attributes(): array
    {
        return [
            'products_extra.*.price' => trans('plugins/ecommerce::products.price'),
            'products_extra.*.quantity' => trans('plugins/ecommerce::products.quantity'),
        ];
    }
}
