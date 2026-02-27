<?php

namespace Database\Seeders;

use App\Core\ACL\Database\Seeders\UserSeeder;
use App\Core\Base\Supports\BaseSeeder;
use App\Plugins\Ecommerce\Database\Seeders\CurrencySeeder;
use App\Plugins\Ecommerce\Database\Seeders\DiscountSeeder;
use App\Plugins\Ecommerce\Database\Seeders\ProductSpecificationSeeder;
use App\Plugins\Ecommerce\Database\Seeders\ReviewSeeder;
use App\Plugins\Ecommerce\Database\Seeders\ShippingSeeder;
use App\Plugins\Ecommerce\Database\Seeders\TaxSeeder;
use App\Plugins\Language\Database\Seeders\LanguageSeeder;

class DatabaseSeeder extends BaseSeeder
{
    public function run(): void
    {
        $this->prepareRun();

        $this->call([
            LanguageSeeder::class,
            BrandSeeder::class,
            CurrencySeeder::class,
            ProductCategorySeeder::class,
            ProductCollectionSeeder::class,
            ProductLabelSeeder::class,
            ProductAttributeSeeder::class,
            ProductSeeder::class,
            CustomerSeeder::class,
            ReviewSeeder::class,
            TaxSeeder::class,
            ProductTagSeeder::class,
            FlashSaleSeeder::class,
            DiscountSeeder::class,
            ShippingSeeder::class,
            ContactSeeder::class,
            UserSeeder::class,
            BlogSeeder::class,
            SimpleSliderSeeder::class,
            PageSeeder::class,
            AdsSeeder::class,
            FaqSeeder::class,
            SettingSeeder::class,
            ProductSpecificationSeeder::class,
            StoreLocatorSeeder::class,
            MenuSeeder::class,
            ThemeOptionSeeder::class,
            WidgetSeeder::class,
            ProductOptionSeeder::class,
            MarketplaceSeeder::class,
        ]);

        $this->finished();
    }
}
