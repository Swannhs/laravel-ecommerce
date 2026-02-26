<?php

namespace App\Plugins\Marketplace\Forms\Fields;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Forms\Fields\TextareaField;
use App\Core\Base\Supports\Editor;
use Illuminate\Support\Arr;

class CustomEditorField extends TextareaField
{
    public function render(array $options = [], $showLabel = true, $showField = true, $showError = true): string
    {
        (new Editor())->registerAssets();

        Arr::set(
            $options,
            'attr.class',
            ltrim(Arr::get($options, 'attr.class') . ' form-control editor-' . BaseHelper::getRichEditor())
        );

        return parent::render($options, $showLabel, $showField, $showError);
    }
}
