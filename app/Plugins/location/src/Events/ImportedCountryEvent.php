<?php

namespace App\Plugins\Location\Events;

use App\Core\Base\Events\Event;
use App\Plugins\Location\Models\Country;
use Illuminate\Queue\SerializesModels;

class ImportedCountryEvent extends Event
{
    use SerializesModels;

    public function __construct(public array $row, public Country $country)
    {
    }
}
