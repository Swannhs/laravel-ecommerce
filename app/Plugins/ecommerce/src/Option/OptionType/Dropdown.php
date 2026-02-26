<?php

namespace App\Plugins\Ecommerce\Option\OptionType;

use App\Plugins\Ecommerce\Option\Interfaces\OptionTypeInterface;

class Dropdown extends BaseOptionType implements OptionTypeInterface
{
    public function view(): string
    {
        return 'dropdown';
    }
}
