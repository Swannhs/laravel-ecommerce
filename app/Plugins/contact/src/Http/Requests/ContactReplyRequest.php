<?php

namespace App\Plugins\Contact\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class ContactReplyRequest extends Request
{
    public function rules(): array
    {
        return [
            'message' => ['required', 'string', 'max:10000'],
        ];
    }
}
