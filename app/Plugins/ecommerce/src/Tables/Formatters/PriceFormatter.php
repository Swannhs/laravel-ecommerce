<?php

namespace App\Plugins\Ecommerce\Tables\Formatters;

use App\Core\Table\Formatter;

class PriceFormatter implements Formatter
{
    public function format($value, $row): string
    {
        return format_price($value);
    }
}
