<?php

namespace App\Plugins\Location\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Rules\MediaImageRule;
use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CityRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:250'],
            'state_id' => ['nullable', 'exists:states,id'],
            'country_id' => ['required', 'exists:countries,id'],
            'slug' => [
                'nullable',
                'string',
                Rule::unique('cities', 'slug')->ignore($this->route('city')),
            ],
            'image' => ['nullable', 'string', new MediaImageRule()],
            'order' => ['required', 'integer', 'min:0', 'max:127'],
            'status' => [Rule::in(BaseStatusEnum::values())],
            'is_default' => [new OnOffRule()],
            'zip_code' => ['nullable', ...BaseHelper::getZipcodeValidationRule(true)],
        ];
    }
}
