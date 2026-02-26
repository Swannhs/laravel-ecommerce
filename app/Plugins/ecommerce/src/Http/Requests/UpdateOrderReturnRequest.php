<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Plugins\Ecommerce\Enums\OrderReturnStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class UpdateOrderReturnRequest extends Request
{
    public function rules(): array
    {
        return [
            'description' => [
                'nullable',
                Rule::requiredIf(fn () => $this->input('return_status') == OrderReturnStatusEnum::CANCELED),
                'string',
                'max:400',
            ],
            'return_status' => ['required', 'string', Rule::in(OrderReturnStatusEnum::values())],
        ];
    }
}
