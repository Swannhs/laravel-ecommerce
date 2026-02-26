<?php

namespace App\Plugins\Faq;

use App\Packages\PluginManagement\Abstracts\PluginOperationAbstract;
use App\Core\Setting\Facades\Setting;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('faq_categories');
        Schema::dropIfExists('faqs');
        Schema::dropIfExists('faq_categories_translations');
        Schema::dropIfExists('faqs_translations');

        Setting::delete([
            'enable_faq_schema',
        ]);
    }
}
