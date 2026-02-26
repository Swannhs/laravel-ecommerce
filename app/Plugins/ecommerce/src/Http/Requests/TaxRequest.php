<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class TaxRequest extends Request
{
    public function rules(): array
    {
        return [
            'title' => ['required', 'string', 'max:255'],
            'percentage' => ['required', 'numeric', 'between:0,99.99'],
            'priority' => ['required', 'integer', 'min:0'],
            'status' => 'required|' . Rule::in(BaseStatusEnum::values()),
        ];
    }
}
