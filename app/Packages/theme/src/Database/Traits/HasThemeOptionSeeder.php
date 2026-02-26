<?php

namespace App\Packages\Theme\Database\Traits;

use App\Core\Setting\Facades\Setting;
use App\Packages\Theme\Facades\ThemeOption;

trait HasThemeOptionSeeder
{
    protected function truncateOptions(): void
    {
        Setting::newQuery()->where('key', 'LIKE', ThemeOption::getOptionKey('%'))->delete();
    }

    protected function createThemeOptions(array $options, bool $truncate = true): void
    {
        if ($truncate) {
            $this->truncateOptions();
        }

        Setting::set(ThemeOption::prepareFromArray($options));

        Setting::save();
    }
}
