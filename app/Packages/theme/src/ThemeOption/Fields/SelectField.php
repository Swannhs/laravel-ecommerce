<?php

namespace App\Packages\Theme\ThemeOption\Fields;

use App\Packages\Theme\Concerns\ThemeOption\Fields\HasOptions;
use App\Packages\Theme\ThemeOption\ThemeOptionField;

class SelectField extends ThemeOptionField
{
    use HasOptions;

    public function fieldType(): string
    {
        return 'customSelect';
    }

    public function toArray(): array
    {
        return [
            ...parent::toArray(),
            'attributes' => [
                ...parent::toArray()['attributes'],
                'choices' => $this->options,
            ],
        ];
    }
}
