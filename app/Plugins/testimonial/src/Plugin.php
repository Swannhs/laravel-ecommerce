<?php

namespace App\Plugins\Testimonial;

use App\Packages\PluginManagement\Abstracts\PluginOperationAbstract;
use Illuminate\Support\Facades\Schema;

class Plugin extends PluginOperationAbstract
{
    public static function remove(): void
    {
        Schema::dropIfExists('testimonials');
        Schema::dropIfExists('testimonials_translations');
    }
}
