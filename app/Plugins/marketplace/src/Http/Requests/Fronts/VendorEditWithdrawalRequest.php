<?php

namespace App\Plugins\Marketplace\Http\Requests\Fronts;

use App\Core\Support\Http\Requests\Request;

class VendorEditWithdrawalRequest extends Request
{
    public function rules(): array
    {
        return [
            'description' => ['nullable', 'max:400'],
        ];
    }
}
