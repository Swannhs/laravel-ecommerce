<?php

namespace App\Plugins\SimpleSlider;

use App\Packages\PluginManagement\Abstracts\PluginOperationAbstract;
use App\Core\Setting\Facades\Setting;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('simple_sliders');
        Schema::dropIfExists('simple_slider_items');

        Setting::delete([
            'simple_slider_using_assets',
        ]);
    }
}
