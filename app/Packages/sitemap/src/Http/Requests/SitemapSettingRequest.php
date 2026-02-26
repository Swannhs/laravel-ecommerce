<?php

namespace App\Packages\Sitemap\Http\Requests;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class SitemapSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'sitemap_enabled' => [new OnOffRule()],
            'sitemap_items_per_page' => ['nullable', 'integer', 'min:10', 'max:100000'],
            'indexnow_enabled' => [new OnOffRule()],
            'indexnow_api_key' => ['nullable', 'string', 'uuid', 'max:255'],
        ];
    }
}
