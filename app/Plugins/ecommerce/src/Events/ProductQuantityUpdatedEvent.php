<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Product;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class ProductQuantityUpdatedEvent extends Event
{
    use SerializesModels;
    use Dispatchable;

    public function __construct(public Product $product)
    {
    }
}
