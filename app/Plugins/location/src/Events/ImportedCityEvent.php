<?php

namespace App\Plugins\Location\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Location\Models\City;
use Illuminate\Queue\SerializesModels;

class ImportedCityEvent extends Event
{
    use SerializesModels;

    public function __construct(public array $row, public City $city)
    {
    }
}
