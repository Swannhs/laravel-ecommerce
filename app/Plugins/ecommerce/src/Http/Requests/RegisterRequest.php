<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Facades\BaseHelper;
use App\Core\Base\Http\Requests\Concerns\HasPhoneFieldValidation;
use App\Core\Base\Rules\EmailRule;
use App\Core\Base\Rules\UniquePhoneRule;
use App\Plugins\Ecommerce\Facades\EcommerceHelper;
use App\Plugins\Ecommerce\Models\Customer;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class RegisterRequest extends Request
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
                Rule::unique((new Customer())->getTable()),
            ],
            'phone' => [
                'nullable',
                Rule::requiredIf(EcommerceHelper::isLoginUsingPhone() || get_ecommerce_setting('make_customer_phone_number_required', false)),
                ...explode('|', BaseHelper::getPhoneValidationRule()),
                UniquePhoneRule::make(Customer::class),
            ],
            'password' => ['required', 'min:6', 'confirmed'],
            'agree_terms_and_policy' => ['sometimes', 'accepted:1'],
        ];

        return apply_filters('ecommerce_customer_registration_form_validation_rules', $rules);
    }

    public function attributes(): array
    {
        return apply_filters('ecommerce_customer_registration_form_validation_attributes', [
            'name' => __('Name'),
            'email' => __('Email'),
            'password' => __('Password'),
            'phone' => __('Phone'),
            'agree_terms_and_policy' => __('Term and Policy'),
        ]);
    }

    public function messages(): array
    {
        return apply_filters('ecommerce_customer_registration_form_validation_messages', []);
    }
}
