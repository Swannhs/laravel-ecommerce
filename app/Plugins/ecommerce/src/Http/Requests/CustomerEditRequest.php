<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Http\Requests\Concerns\HasPhoneFieldValidation;
use App\Core\Base\Rules\EmailRule;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Customer;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CustomerEditRequest extends Request
{
    use HasPhoneFieldValidation;

    protected function prepareForValidation(): void
    {
        $this->preparePhoneForValidation();
    }

    public function rules(): array
    {
        $rules = [
            'name' => ['required', 'max:120', 'min:2'],
            'email' => [
                'nullable',
                Rule::requiredIf(! EcommerceHelper::isLoginUsingPhone()),
                new EmailRule(),
                Rule::unique((new Customer())->getTable(), 'email')->ignore($this->route('customer.id')),
            ],
        ];

        if ($this->boolean('is_change_password')) {
            $rules['password'] = 'required|string|min:6';
            $rules['password_confirmation'] = 'required|same:password';
        }

        return $rules;
    }
}
