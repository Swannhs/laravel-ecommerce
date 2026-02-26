<?php

namespace App\Plugins\Blog\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Rules\MediaImageRule;
use App\Core\Base\Rules\OnOffRule;
use App\Plugins\Blog\Models\Category;
use App\Plugins\Blog\Supports\PostFormat;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class PostRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'name' => ['required', 'string', 'max:250'],
            'description' => ['nullable', 'string', 'max:400'],
            'content' => ['nullable', 'string', 'max:300000'],
            'tag' => ['nullable', 'string', 'max:400'],
            'categories' => ['sometimes', 'array'],
            'categories.*' => ['sometimes', Rule::exists((new Category())->getTable(), 'id')],
            'status' => Rule::in(BaseStatusEnum::values()),
            'is_featured' => [new OnOffRule()],
            'image' => ['nullable', 'string', new MediaImageRule()],
        ];

        $postFormats = PostFormat::getPostFormats(true);

        if (count($postFormats) > 1) {
            $rules['format_type'] = Rule::in(array_keys($postFormats));
        }

        return $rules;
    }

    public function attributes(): array
    {
        return [
            'name' => trans('plugins/blog::posts.form.name'),
            'description' => trans('plugins/blog::posts.form.description'),
            'content' => trans('plugins/blog::posts.form.content'),
            'tag' => trans('plugins/blog::posts.form.tags'),
            'categories' => trans('plugins/blog::posts.form.categories'),
            'status' => trans('core/base::tables.status'),
            'is_featured' => trans('plugins/blog::posts.form.is_featured'),
            'image' => trans('core/base::forms.image'),
            'format_type' => trans('plugins/blog::posts.form.format_type'),
        ];
    }
}
