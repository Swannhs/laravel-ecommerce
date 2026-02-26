<?php

namespace App\Plugins\LanguageAdvanced\Listeners;

use App\Plugins\Language\Facades\Language;
use App\Packages\Theme\Facades\AdminBar;

class AddRefLangToAdminBar
{
    public function handle(): void
    {
        if (Language::getDefaultLocaleCode() === Language::getCurrentLocaleCode()) {
            return;
        }

        $groups = AdminBar::getLinksNoGroup();

        foreach ($groups as &$group) {
            $group['link'] .= sprintf('?%s=%s', Language::refLangKey(), Language::getCurrentLocaleCode());
        }

        AdminBar::setLinksNoGroup($groups);
    }
}
