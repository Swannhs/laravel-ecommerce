<?php

namespace App\Packages\Installer\Http\Requests;

use App\Packages\Installer\InstallerStep\InstallerStep;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class ChooseThemeRequest extends Request
{
    public function rules(): array
    {
        return [
            'theme' => ['required', 'string', Rule::in(array_keys(InstallerStep::getThemes()))],
        ];
    }
}
