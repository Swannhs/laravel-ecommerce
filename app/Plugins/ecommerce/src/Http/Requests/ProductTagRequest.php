<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ProductTagRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:250'],
            'description' => ['nullable', 'string', 'max:400'],
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
