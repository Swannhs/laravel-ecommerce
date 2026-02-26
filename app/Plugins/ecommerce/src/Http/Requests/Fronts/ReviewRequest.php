<?php

namespace App\Plugins\Ecommerce\Http\Requests\Fronts;

use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Core\Support\Http\Requests\Request;

class ReviewRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'product_id' => ['required', 'exists:ec_products,id'],
            'star' => ['required', 'numeric', 'min:1', 'max:5'],
            'comment' => ['required', 'string', 'max:5000'],
        ];

        if (EcommerceHelper::isCustomerReviewImageUploadEnabled()) {
            $rules['images'] = 'array|max:' . EcommerceHelper::reviewMaxFileNumber();
            $rules['images.*'] = 'image|mimes:jpg,jpeg,png|max:' . EcommerceHelper::reviewMaxFileSize(true);
        }

        return $rules;
    }
}
