<?php

namespace App\Plugins\Faq\Http\Requests\Settings;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class FaqSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'enable_faq_schema' => new OnOffRule(),
        ];
    }
}
