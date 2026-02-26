<?php

namespace App\Core\Base\Forms\FieldOptions;

use App\Core\Base\Enums\BaseStatusEnum;

class StatusFieldOption extends SelectFieldOption
{
    public static function make(): static
    {
        return parent::make()
            ->label(trans('core/base::forms.status'))
            ->required()
            ->choices(BaseStatusEnum::labels());
    }
}
