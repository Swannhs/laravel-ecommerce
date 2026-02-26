<?php

namespace App\Plugins\Marketplace\Http\Requests\Fronts;

use App\Core\Base\Rules\EmailRule;
use App\Core\Base\Rules\MediaImageRule;
use App\Plugins\Marketplace\Http\Requests\StoreRequest;
use App\Plugins\Marketplace\Models\Store;
use Illuminate\Validation\Rule;

class VendorStoreRequest extends StoreRequest
{
    public function rules(): array
    {
        $rules = parent::rules();

        unset($rules['customer_id'], $rules['status']);

        $rules['email'] = [
            'required',
            new EmailRule(),
            Rule::unique((new Store())->getTable(), 'email')
                ->ignore(auth('customer')->user()->store?->id),
        ];

        $rules['logo_input'] = ['nullable', new MediaImageRule()];
        $rules['cover_image_input'] = ['nullable', new MediaImageRule()];

        return $rules;
    }
}
