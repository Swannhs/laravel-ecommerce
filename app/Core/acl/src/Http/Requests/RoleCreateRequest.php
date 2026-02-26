<?php

namespace App\Core\ACL\Http\Requests;

use App\Core\Base\Rules\OnOffRule;
use App\Core\Support\Http\Requests\Request;

class RoleCreateRequest extends Request
{
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'max:120', 'min:3'],
            'description' => ['nullable', 'string', 'string', 'max:255'],
            'is_default' => [new OnOffRule()],
        ];
    }
}
