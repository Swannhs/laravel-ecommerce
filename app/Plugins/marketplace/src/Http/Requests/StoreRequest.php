<?php

namespace App\Plugins\Marketplace\Http\Requests;

use App\Core\Base\Enums\BaseStatusEnum;
use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Rules\EmailRule;
use App\Core\Base\Rules\MediaImageRule;
use App\Plugins\Marketplace\Models\Store;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class StoreRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'max:250', 'min:2'],
            'email' => [
                'required',
                new EmailRule(),
                Rule::unique((new Store())->getTable(), 'email')
                    ->ignore($this->route('store.id')),
            ],
            'phone' => 'required|' . BaseHelper::getPhoneValidationRule(),
            'slug' => ['required', 'string', 'max:255'],
            'customer_id' => ['required', 'string', 'exists:ec_customers,id'],
            'description' => ['nullable', 'max:400', 'string'],
            'status' => Rule::in(BaseStatusEnum::values()),
            'company' => ['nullable', 'string', 'max:255'],
            'tax_id' => ['nullable', 'string', 'max:255'],
            'zip_code' => ['nullable', ...BaseHelper::getZipcodeValidationRule(true)],
            'logo' => ['nullable', 'string', new MediaImageRule()],
            'logo_square' => ['nullable', 'string', new MediaImageRule()],
            'cover_image' => ['nullable', 'string', new MediaImageRule()],
        ];
    }
}
