<?php

namespace App\Plugins\Faq\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class FaqRequest extends Request
{
    public function rules(): array
    {
        return [
            'category_id' => ['required', 'exists:faq_categories,id'],
            'question' => ['required', 'string'],
            'answer' => ['required', 'string'],
            'status' => ['required', Rule::in(BaseStatusEnum::values())],
        ];
    }
}
