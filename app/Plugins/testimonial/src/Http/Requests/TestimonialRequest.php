<?php

namespace App\Plugins\Testimonial\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class TestimonialRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:250'],
            'company' => ['nullable', 'string', 'max:250'],
            'content' => ['required', 'string', 'max:1000'],
            'status' => Rule::in(BaseStatusEnum::values()),
        ];
    }
}
