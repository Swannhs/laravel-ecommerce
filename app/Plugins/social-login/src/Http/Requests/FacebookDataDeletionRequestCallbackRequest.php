<?php

namespace App\Plugins\SocialLogin\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class FacebookDataDeletionRequestCallbackRequest extends Request
{
    public function rules(): array
    {
        return [
            'signed_request' => ['required', 'string'],
        ];
    }
}
