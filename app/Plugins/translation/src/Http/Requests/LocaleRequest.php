<?php

namespace App\Plugins\Translation\Http\Requests;

use App\Core\Base\Supports\Language;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class LocaleRequest extends Request
{
    public function rules(): array
    {
        return [
            'locale' => ['required', Rule::in(Language::getLocaleKeys())],
        ];
    }
}
