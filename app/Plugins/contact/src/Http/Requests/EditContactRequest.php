<?php

namespace App\Plugins\Contact\Http\Requests;

use App\Plugins\Contact\Enums\ContactStatusEnum;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class EditContactRequest extends Request
{
    public function rules(): array
    {
        return [
            'status' => Rule::in(ContactStatusEnum::values()),
        ];
    }
}
