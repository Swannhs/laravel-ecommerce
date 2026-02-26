<?php

use App\Plugins\Marketplace\Models\Store;
use App\Packages\Slug\Facades\SlugHelper;
use App\Packages\Slug\Models\Slug;
use Illuminate\Database\Migrations\Migration;

return new class () extends Migration {
    public function up(): void
    {
        try {
            Slug::query()
                ->where('reference_type', Store::class)
                ->update(['prefix' => SlugHelper::getPrefix(Store::class)]);
        } catch (Throwable) {
        }
    }
};
