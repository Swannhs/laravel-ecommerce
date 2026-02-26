<?php

namespace App\Core\Setting\Http\Requests;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class EmailTemplateChangeStatusRequest extends Request
{
    public function rules(): array
    {
        return [
            'key' => ['required', 'string'],
            'value' => [new OnOffRule()],
        ];
    }
}
