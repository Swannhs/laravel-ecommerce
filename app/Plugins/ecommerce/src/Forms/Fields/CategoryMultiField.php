<?php

namespace App\Plugins\Ecommerce\Forms\Fields;

use App\Core\Base\Forms\FormField;

/**
 * @deprecated
 */
class CategoryMultiField extends FormField
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.tree-categories';
    }
}
