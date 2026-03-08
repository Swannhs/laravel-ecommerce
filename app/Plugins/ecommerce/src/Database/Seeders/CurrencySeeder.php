<?php

namespace App\Plugins\Ecommerce\Database\Seeders;

use App\Core\Base\Supports\BaseSeeder;
use App\Plugins\Ecommerce\Models\Currency;

class CurrencySeeder extends BaseSeeder
{
    public function run(): void
    {
        Currency::query()->truncate();

        $currencies = [
            [
                'title' => 'BDT',
                'symbol' => '৳',
                'is_prefix_symbol' => true,
                'order' => 0,
                'decimals' => 2,
                'is_default' => 1,
                'exchange_rate' => 1,
            ],
            [
                'title' => 'USD',
                'symbol' => '$',
                'is_prefix_symbol' => true,
                'order' => 1,
                'decimals' => 2,
                'is_default' => 0,
                'exchange_rate' => 0.009,
            ],
        ];

        foreach ($currencies as $currency) {
            Currency::query()->create($currency);
        }
    }
}
