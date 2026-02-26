<?php

namespace App\Plugins\Location\Http\Resources;

use App\Plugins\Location\Models\City;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin City
 */
class CityResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->getKey(),
            'name' => $this->name,
        ];
    }
}
