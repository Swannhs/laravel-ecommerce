<?php

namespace App\Plugins\Ecommerce\Http\Requests\Settings;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class ProductSearchSettingRequest extends Request
{
    public function rules(): array
    {
        return [
            'search_for_an_exact_phrase' => $onOffRule = new OnOffRule(),
            'search_products_by' => ['required', 'array'],
            'search_products_by.*' => ['required', 'in:name,sku,variation_sku,description,brand,tag'],
            'enable_filter_products_by_categories' => $onOffRule,
            'enable_filter_products_by_brands' => $onOffRule,
            'enable_filter_products_by_tags' => $onOffRule,
            'number_of_popular_tags_for_filter' => ['nullable', 'integer', 'min:1', 'max:100'],
            'enable_filter_products_by_attributes' => $onOffRule,
            'enable_filter_products_by_price' => $onOffRule,
            'max_product_price_for_filter' => ['nullable', 'numeric', 'min:0'],
        ];
    }
}
