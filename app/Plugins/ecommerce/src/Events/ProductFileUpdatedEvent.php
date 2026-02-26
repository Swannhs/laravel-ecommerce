<?php

namespace App\Plugins\Ecommerce\Events;

use App\Plugins\Ecommerce\Models\Product;
use App\Plugins\Ecommerce\Models\ProductFile;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Collection;

class ProductFileUpdatedEvent
{
    use Dispatchable;
    use SerializesModels;

    /**
     * @param  Collection<ProductFile>  $productFiles
     */
    public function __construct(public Product $product, public Collection $productFiles)
    {
    }
}
