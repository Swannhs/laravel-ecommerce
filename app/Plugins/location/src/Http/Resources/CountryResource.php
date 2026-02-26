<?php

namespace App\Plugins\Location\Http\Resources;

use App\Plugins\Location\Models\Country;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Country
 */
class CountryResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->getKey(),
            'name' => $this->name,
            'code' => $this->code,
        ];
    }
}
