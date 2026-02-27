<?php

namespace Database\Seeders;

use App\Core\Base\Supports\BaseSeeder;
use App\Plugins\Ecommerce\Models\ProductTag;
use App\Packages\Slug\Facades\SlugHelper;
use App\Packages\Slug\Models\Slug;
use Illuminate\Support\Str;

class ProductTagSeeder extends BaseSeeder
{
    public function run(): void
    {
        $tags = [
            [
                'name' => 'Electronic',
            ],
            [
                'name' => 'Mobile',
            ],
            [
                'name' => 'Iphone',
            ],
            [
                'name' => 'Printer',
            ],
            [
                'name' => 'Office',
            ],
            [
                'name' => 'IT',
            ],
        ];

        ProductTag::query()->truncate();

        foreach ($tags as $item) {
            $tag = ProductTag::query()->create($item);

            Slug::query()->create([
                'reference_type' => ProductTag::class,
                'reference_id' => $tag->id,
                'key' => Str::slug($tag->name),
                'prefix' => SlugHelper::getPrefix(ProductTag::class),
            ]);
        }
    }
}
