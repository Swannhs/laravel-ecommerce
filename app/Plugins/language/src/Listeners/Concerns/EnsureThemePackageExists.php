<?php

namespace App\Plugins\Language\Listeners\Concerns;

use App\Packages\Theme\Theme;

trait EnsureThemePackageExists
{
    public function determineIfThemesExists(): bool
    {
        return class_exists(Theme::class);
    }
}
