<?php

namespace App\Core\Setting\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class EmailSendTestRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => ['required', 'email'],
        ];
    }
}
