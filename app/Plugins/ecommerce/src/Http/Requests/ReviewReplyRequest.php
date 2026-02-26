<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class ReviewReplyRequest extends Request
{
    public function rules(): array
    {
        return [
            'message' => ['required', 'string', 'max:1000'],
        ];
    }
}
