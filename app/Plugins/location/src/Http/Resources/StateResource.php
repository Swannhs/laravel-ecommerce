<?php

namespace App\Plugins\Location\Http\Resources;

use App\Plugins\Location\Models\State;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin State
 */
class StateResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->getKey(),
            'name' => $this->name,
        ];
    }
}
