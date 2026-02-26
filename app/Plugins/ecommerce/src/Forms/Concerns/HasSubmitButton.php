<?php

namespace App\Plugins\Ecommerce\Forms\Concerns;

use App\Core\Base\Facades\BaseHelper;

trait HasSubmitButton
{
    public function addSubmitButton(string $label, ?string $icon = null, array $attributes = []): static
    {
        $this->add('submit', 'submit', [
            'label' => ($icon ? BaseHelper::renderIcon($icon) . ' ' : '') . $label,
            'attr' => [
                'class' => 'btn btn-primary',
            ],
            ...$attributes,
        ]);

        return $this;
    }
}
