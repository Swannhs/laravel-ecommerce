<?php

namespace Theme\Martfury\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class SendDownloadAppLinksRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => ['required', 'email'],
        ];
    }
}
