<?php

namespace App\Plugins\Ecommerce\Http\Requests;

use App\Core\Base\Rules\EmailRule;
use App\Plugins\Ecommerce\Models\Customer;
use App\Core\Support\Http\Requests\Request;
use Illuminate\Validation\Rule;

class CustomerUpdateEmailRequest extends Request
{
    public function rules(): array
    {
        return [
            'email' => [
                'required',
                new EmailRule(),
                Rule::unique((new Customer())->getTable(), 'email')->ignore($this->route('id')),
            ],
        ];
    }
}
