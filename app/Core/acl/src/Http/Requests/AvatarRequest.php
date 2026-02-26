<?php

namespace App\Core\ACL\Http\Requests;

use App\Core\Media\Facades\RvMedia;
use App\Core\Support\Http\Requests\Request;

class AvatarRequest extends Request
{
    public function rules(): array
    {
        return [
            'avatar_file' => RvMedia::imageValidationRule(),
        ];
    }
}
