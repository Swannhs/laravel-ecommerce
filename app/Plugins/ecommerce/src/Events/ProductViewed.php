<?php

namespace App\Plugins\Ecommerce\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Ecommerce\Models\Product;
use Carbon\CarbonInterface;
use Illuminate\Queue\SerializesModels;

class ProductViewed extends Event
{
    use SerializesModels;

    public function __construct(public Product $product, public CarbonInterface $dateTime)
    {
    }
}
