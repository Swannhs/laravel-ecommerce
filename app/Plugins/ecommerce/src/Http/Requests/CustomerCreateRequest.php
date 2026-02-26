<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Http\Requests\Concerns\HasPhoneFieldValidation;
use App\Core\Base\Rules\EmailRule;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Customer;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CustomerCreateRequest extends Request
{
    use HasPhoneFieldValidation;

    protected function prepareForValidation(): void
    {
        $this->preparePhoneForValidation();
    }

    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'min:2', 'max:120'],
            'email' => [
                'nullable',
                Rule::requiredIf(! EcommerceHelper::isLoginUsingPhone()),
                new EmailRule(),
                Rule::unique((new Customer())->getTable(), 'email'),
            ],
            'password' => ['required', 'string', 'min:6', 'confirmed'],
            'private_notes' => ['nullable', 'string', 'max:1000'],
        ];
    }
}
