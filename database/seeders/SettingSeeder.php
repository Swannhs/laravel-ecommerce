<?php

namespace Database\Seeders;

use App\Core\Base\Supports\BaseSeeder;
use App\Plugins\Blog\Database\Traits\HasBlogSeeder;
use App\Plugins\Ecommerce\Database\Seeders\Traits\HasEcommerceSettingsSeeder;

class SettingSeeder extends BaseSeeder
{
    use HasBlogSeeder;
    use HasEcommerceSettingsSeeder;

    public function run(): void
    {
        $settings = [
            'admin_favicon' => 'general/favicon.png',
            'admin_logo' => 'general/logo-light.png',
        ];

        $this->saveSettings($settings);

        $this->saveEcommerceSettings();

        $this->setPostSlugPrefix();
    }
}
