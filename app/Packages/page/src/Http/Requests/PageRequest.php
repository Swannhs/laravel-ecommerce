<?php

namespace App\Packages\Page\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Rules\MediaImageRule;
use App\Packages\Page\Supports\Template;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PageRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:120'],
            'description' => ['nullable', 'string', 'max:400'],
            'content' => ['nullable', 'string'],
            'template' => [Rule::in(array_keys(Template::getPageTemplates()))],
            'status' => [Rule::in(BaseStatusEnum::values())],
            'image' => ['nullable', 'string', new MediaImageRule()],
        ];
    }
}
