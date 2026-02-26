<?php

namespace App\Packages\DataSynchronize\Http\Requests;

use App\Core\Support\Http\Requests\Request;

class DownloadTemplateRequest extends Request
{
    public function rules(): array
    {
        return [
            'format' => ['required', 'string', 'in:csv,xlsx'],
        ];
    }
}
