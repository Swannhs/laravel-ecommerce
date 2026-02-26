<?php

namespace App\Plugins\Marketplace\Http\Requests\Vendor;

use App\Core\Base\Supports\Language;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class LanguageSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'locale' => ['sometimes', 'required', Rule::in(array_keys(Language::getAvailableLocales()))],
        ];
    }
}
