<?php

namespace App\Plugins\SimpleSlider\Http\Requests\Settings;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class SimpleSliderSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'simple_slider_using_assets' => new OnOffRule(),
        ];
    }
}
