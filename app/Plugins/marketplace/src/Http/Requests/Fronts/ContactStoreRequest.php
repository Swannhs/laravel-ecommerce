<?php

namespace App\Plugins\Marketplace\Http\Requests\Fronts;

use App\Core\Base\Rules\EmailRule;
use App\Core\Support\Http\Requests\Request;

class ContactStoreRequest extends Request
{
    public function rules(): array
    {
        $rules = [
            'content' => ['required', 'string', 'max:1000'],
        ];

        if (! auth('customer')->check()) {
            $rules += [
                'name' => ['required', 'string', 'max:120'],
                'email' => ['required', new EmailRule()],
            ];
        }

        return $rules;
    }
}
