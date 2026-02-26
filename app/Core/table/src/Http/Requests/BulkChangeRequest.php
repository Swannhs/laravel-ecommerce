<?php

namespace App\Core\Table\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class BulkChangeRequest extends Request
{
    public function rules(): array
    {
        return [
            'key' => ['required', 'string'],
            'class' => ['required', 'string'],
        ];
    }
}
