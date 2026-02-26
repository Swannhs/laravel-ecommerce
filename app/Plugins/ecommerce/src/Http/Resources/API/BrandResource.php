<?php

namespace App\Plugins\Ecommerce\Http\Resources\API;

use App\Plugins\Ecommerce\Models\Brand;
use App\Core\Media\Facades\RvMedia;
use Illuminate\Http\Resources\Json\JsonResource;

/**
 * @mixin Brand
 */
class BrandResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'website' => $this->website,
            'description' => $this->description,
            'is_featured' => $this->is_featured,
            'slug' => $this->slug,
            'logo' => $this->logo ? RvMedia::getImageUrl($this->logo) : null,
            'logo_with_sizes' => $this->logo ? rv_get_image_sizes($this->logo, array_unique([
                'origin',
                'thumb',
                ...array_keys(RvMedia::getSizes()),
            ])) : null,
        ];
    }
}
