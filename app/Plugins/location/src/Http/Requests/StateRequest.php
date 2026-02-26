<?php

namespace App\Plugins\Location\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class StateRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:250'],
            'country_id' => ['required', 'integer'],
            'slug' => [
                'nullable',
                'string',
                Rule::unique('states', 'slug')->ignore($this->route('state')),
            ],
            'image' => ['nullable', 'string'],
            'order' => ['required', 'integer', 'min:0', 'max:127'],
            'abbreviation' => ['max:10'],
            'status' => [Rule::in(BaseStatusEnum::values())],
            'is_default' => [new OnOffRule()],
        ];
    }
}
