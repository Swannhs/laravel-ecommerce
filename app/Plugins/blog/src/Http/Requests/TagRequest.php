<?php

namespace App\Plugins\Blog\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class TagRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:120'],
            'description' => ['nullable', 'string', 'max:400'],
            'status' => [Rule::in(BaseStatusEnum::values())],
        ];
    }

    public function attributes(): array
    {
        return [
            'name' => trans('plugins/blog::tags.form.name'),
            'description' => trans('plugins/blog::tags.form.description'),
            'status' => trans('core/base::tables.status'),
        ];
    }
}
