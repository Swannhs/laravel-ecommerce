<?php

namespace App\Plugins\Location\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CountryRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:250'],
            'code' => ['required', 'string', 'max:1230'],
            'nationality' => ['nullable', 'string', 'max:120'],
            'order' => ['required', 'integer', 'min:0', 'max:127'],
            'status' => [Rule::in(BaseStatusEnum::values())],
            'is_default' => [new OnOffRule()],
        ];
    }
}
