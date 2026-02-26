<?php

namespace App\Packages\Installer\Http\Requests;

use App\Packages\Installer\InstallerStep\InstallerStep;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ChooseThemePresetRequest extends Request
{
    public function rules(): array
    {
        return [
            'theme_preset' => ['required', 'string', Rule::in(array_keys(InstallerStep::getThemePresets()))],
        ];
    }
}
