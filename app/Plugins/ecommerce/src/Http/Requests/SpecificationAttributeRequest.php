<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Plugins\Ecommerce\Enums\SpecificationAttributeFieldType;
use App\Plugins\Ecommerce\Models\SpecificationGroup;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class SpecificationAttributeRequest extends Request
{
    public function rules(): array
    {
        return [
            'group_id' => ['required', 'string', Rule::exists(SpecificationGroup::class, 'id')],
            'name' => ['required', 'string', 'max:250'],
            'type' => ['required', Rule::in(SpecificationAttributeFieldType::values())],
            'default_value' => ['nullable', 'string', 'max:250'],
            'options' => [Rule::requiredIf(fn () => in_array($this->input('type'), [SpecificationAttributeFieldType::SELECT, SpecificationAttributeFieldType::RADIO])), 'array'],
        ];
    }
}
